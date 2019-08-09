//
//  ShopViewController.swift
//  Falcon
//
//  Created by Q on 2019/7/27.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

/// 商店模块
class ShopViewController: FalcViewController<ShopViewModel> {

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

}

extension ShopViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let vm = viewModel?.datas[safe: indexPath.row] as? ShopItemAdContainerTableViewCellModel {
            let cell = tableView.dequeueReusableCell(withClass: ShopItemAdContainerTableViewCell.self)
            cell.selectionStyle = .none
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
    }
}

extension ShopViewController: UITableViewDelegate {}
