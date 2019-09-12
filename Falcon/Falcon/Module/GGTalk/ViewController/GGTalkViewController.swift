//
//  GGTalkViewController.swift
//  Falcon
//
//  Created by Rickey on 2019/9/12.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Then

class GGTalkViewController: FalcViewController<TalkListViewModel> {
    
    lazy private var refreshControl = UIRefreshControl().then { [unowned self] in
        $0.tintColor = UIColor.sgMainTintColor
        $0.addTarget(self, action: #selector(refreshArticlesData), for: .valueChanged)
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
    
    override func initialDatas() {
        super.initialDatas()
        viewModel = TalkListViewModel()
    }
    
    override func initialViews() {
        super.initialViews()
        self.view.backgroundColor = .sgBackgroundColor
        view.addSubview(tableView)
        tableView.refreshControl = refreshControl
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - View Methods
    
    @objc private func refreshArticlesData(_ sender: Any) {
        tableView.reloadData()
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
        // 跳转
//        guard let vm = viewModel?.datas[safe: indexPath.row] as? HomeItemTableViewCellModel else { return }
//        if let url = URL(string: vm.articleUrlString) {
//            let articleViewController = ArticleViewController()
//            let viewModel = ArticleViewModel()
//            viewModel.articleUrlString = url.absoluteString
//            articleViewController.viewModel = viewModel
//            articleViewController.hidesBottomBarWhenPushed = true
//            guard let naviController = self.navigationController else { return }
//            naviController.pushViewController(articleViewController)
//        }
    }
    
}

