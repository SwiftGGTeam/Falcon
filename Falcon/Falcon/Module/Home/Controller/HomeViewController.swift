//
//  ViewController.swift
//  Falcon
//
//  Created by Harry Duan on 2019/6/25.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

class HomeViewController: FalcViewController<HomeViewModel> {
    
    lazy private var refreshControl: UIRefreshControl = { [unowned self] in
        let refreshControl = UIRefreshControl(frame: .zero)
        refreshControl.tintColor = UIColor.sgMainTintColor
        refreshControl.addTarget(self, action: #selector(refreshArticlesData), for: .valueChanged)
        return refreshControl
    }()
    
    lazy private var tableView: UITableView = { [unowned self] in
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.keyboardDismissMode = .onDrag
        tableView.sectionFooterHeight = 0.0
        tableView.sectionHeaderHeight = 38
        tableView.register(cellWithClass: HomeItemTableViewCell.self)
        return tableView
    }()
    
    override func initialDatas() {
        super.initialDatas()
        viewModel = HomeViewModel()
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
        print("Refresh")
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let vm = viewModel?.datas[safe: indexPath.row] as? HomeItemTableViewCellModel {
            let cell = tableView.dequeueReusableCell(withClass: HomeItemTableViewCell.self)
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

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vm = viewModel?.datas[safe: indexPath.row] as? HomeItemTableViewCellModel else { return }
        if let url = URL(string: vm.articleUrlString) {
            let articleViewController = ArticleViewController()
            let viewModel = ArticleViewModel()
            viewModel.articleUrlString = url.absoluteString
            articleViewController.viewModel = viewModel
            articleViewController.hidesBottomBarWhenPushed = true
            guard let naviController = self.navigationController else { return }
            naviController.pushViewController(articleViewController)
        }
    }
    
}

