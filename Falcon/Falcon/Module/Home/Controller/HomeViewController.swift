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
        tableView.sectionHeaderHeight = 38
        tableView.register(cellWithClass: HomeItemTableViewCell.self)
        tableView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    override func initialDatas() {
        super.initialDatas()
        viewModel = HomeViewModel()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate {}

