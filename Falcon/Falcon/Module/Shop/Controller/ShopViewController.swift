//
//  ShopViewController.swift
//  Falcon
//
//  Created by Q on 2019/7/27.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// 商店模块
class ShopViewController: FalcViewController<ShopViewModel> {

    lazy private var refreshControl: UIRefreshControl = { [unowned self] in
        let refreshControl = UIRefreshControl(frame: .zero)
        refreshControl.tintColor = UIColor.sgMainTintColor
        refreshControl.addTarget(self, action: #selector(refreshEventsData), for: .valueChanged)
        return refreshControl
    }()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .sgBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.keyboardDismissMode = .onDrag
        tableView.sectionFooterHeight = 0.0
        tableView.sectionHeaderHeight = 0.0
        tableView.register(cellWithClass: ShopItemAdContainerTableViewCell.self)
        tableView.register(cellWithClass: ShopItemTableViewCell.self)
        return tableView
    }()
    
    override func initialDatas() {
        super.initialDatas()
        viewModel = ShopViewModel()
    }
    
    override func initialViews() {
        super.initialViews()
        view.addSubview(tableView)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func updateViews() {
        super.updateViews()
        tableView.reloadData()
    }
    
    @objc private func refreshEventsData(_ sender: Any) {
        viewModel?.fetchData { [unowned self] in
            self.refreshControl.endRefreshing()
        }
    }
}

extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let vm = viewModel?.datas[safe: indexPath.row] as? ShopItemAdContainerTableViewCellModel {
            let cell = tableView.dequeueReusableCell(withClass: ShopItemAdContainerTableViewCell.self)
            cell.selectionStyle = .none
            vm.didSelectHandler = { [unowned self] (collectView, indexPath) in
                guard let goodsvm = vm.datas[safe: indexPath.row] as? ShopItemAdCollectionViewCellModel else { return }
                self.pushGoodDetailViewControler(with: goodsvm.id, title: goodsvm.titleText)
            }
            cell.viewModel = vm
            return cell
        } else if let vm = viewModel?.datas[safe: indexPath.row] as? ShopItemTableViewCellModel {
            let cell = tableView.dequeueReusableCell(withClass: ShopItemTableViewCell.self)
            cell.selectionStyle = .none
            cell.viewModel = vm
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.datas.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vm = viewModel?.datas[safe: indexPath.row] as? ShopItemTableViewCellModel {
            self.pushGoodDetailViewControler(with: vm.id, title: vm.titleText)
        }
    }
    
    func pushGoodDetailViewControler(with id: Int, title: String) {
        let goodsViewController = ShopDetailViewController()
        let goodsViewModel = ShopDetailViewModel(id: id)
        goodsViewModel.delegate = goodsViewController
        goodsViewController.title = title
        goodsViewController.viewModel = goodsViewModel
        goodsViewController.hidesBottomBarWhenPushed = true
        guard let naviController = self.navigationController else { return }
        naviController.pushViewController(goodsViewController)
    }
}

extension ShopViewController: UITableViewDelegate {}
