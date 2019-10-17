//
//  GGTalkViewController.swift
//  Falcon
//
//  Created by Rickey on 2019/9/12.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Then
import SWXMLHash
import Alamofire

class GGTalkViewController: FalcViewController<TalkListViewModel> {
    
    private let talkListVM = TalkListViewModel()
    private lazy var detailVC = TalkDetailViewController()
    
    lazy private var refreshControl = UIRefreshControl().then { [unowned self] in
        $0.tintColor = UIColor.sgMainTintColor
        $0.addTarget(self, action: #selector(refreshPageData), for: .valueChanged)
    }
    
    lazy private var tableView = UITableView().then { [unowned self] in
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
        $0.separatorStyle = .none
        $0.estimatedRowHeight = 192.0
        $0.rowHeight = UITableView.automaticDimension
        $0.keyboardDismissMode = .onDrag
        $0.sectionFooterHeight = 0.0
        $0.sectionHeaderHeight = 38
        $0.register(cellWithClass: TalkItemCell.self)
    }
    
    private var talkProgressView = TalkBottomProgressView(TalkProgressViewModel()).then {
        $0.backgroundColor = UIColor(red: 255 / 255.0, green: 255 / 255.0, blue: 255 / 255.0, alpha: 0.3)
        $0.isHidden = true
    }
    
    override func initialDatas() {
        super.initialDatas()
        viewModel = talkListVM
        refreshDataFromServer()
    }
    
    override func updateViews() {
        super.updateViews()
        tableView.reloadData()
    }
    
    override func initialViews() {
        super.initialViews()
        self.view.backgroundColor = .sgBackgroundColor
        view.addSubview(tableView)
        view.addSubview(talkProgressView)
        tableView.refreshControl = refreshControl
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        talkProgressView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(TalkBottomProgressView.ProgressViewHeight)
        }
    }
    
    // MARK: - View Methods
    
    @objc private func refreshPageData(_ sender: Any) {
        refreshDataFromServer()
    }
    
    private func refreshDataFromServer() {
        Alamofire.request("https://talk.swift.gg/static/rss.xml", method: .get, parameters: nil).response { (response) in
            guard let rawXML = response.data else { return }
            let xml = SWXMLHash.config({ (config) in
                config.shouldProcessNamespaces = true
                config.shouldProcessLazily = true
            }).parse(rawXML)
            let itemList = xml["rss"]["channel"]["item"]
            self.talkListVM.setNewData(xmlList: itemList.all)
            // TODO: - 延时收回
            self.refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Gesture
    
    @objc private func showDetailPage() {
        addPullUpController(detailVC, initialStickyPointOffset: Layout.SCREEN_HEIGHT - navbarHeight, animated: true)
    }
    
}

extension GGTalkViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let vm = viewModel?.datas[safe: indexPath.row] as? TalkItemViewModel {
            let cell = tableView.dequeueReusableCell(withClass: TalkItemCell.self)
            cell.selectionStyle = .none
            cell.viewModel = vm
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.datas.count ?? 0
    }
    
}

extension GGTalkViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vm = viewModel?.datas[safe: indexPath.row] as? TalkItemViewModel {
            // 跳转详情页
            detailVC.viewModel = vm
            showDetailPage()
            // 更新底部进度条
            let progressModel = TalkProgressViewModel(with: vm)
            talkProgressView.viewModel = progressModel
            talkProgressView.isHidden = false
        }
    }
    
}
