//
//  EventViewController.swift
//  Falcon
//
//  Created by Q on 2019/8/20.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// 活动模块
class EventViewController: FalcViewController<EventViewModel> {

    lazy private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: view.width - 20, height: 397)
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 10
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellWithClass: EventItemCollectionViewCell.self)
        return collectionView
    }()
    
    override func initialDatas() {
        super.initialDatas()
        viewModel = EventViewModel()
    }
    
    override func initialViews() {
        super.initialViews()
        view.addSubview(collectionView)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension EventViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let vm = viewModel?.datas[safe: indexPath.row] as? EventItemCollectionViewCellModel {
            let cell = collectionView.dequeueReusableCell(withClass: EventItemCollectionViewCell.self, for: indexPath)
            cell.viewModel = vm
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.datas.count ?? 0
    }
}

extension EventViewController: UICollectionViewDelegate {}

