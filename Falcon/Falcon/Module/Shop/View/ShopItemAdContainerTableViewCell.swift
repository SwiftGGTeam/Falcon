//
//  ShopItemAdContainerTableViewCell.swift
//  Falcon
//
//  Created by Q on 2019/7/27.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import SnapKit
import SwifterSwift

/// 特惠广告商品 Container 容器 Cell
class ShopItemAdContainerTableViewCell: FalcTableViewCell<ShopItemAdContainerTableViewCellModel> {

    private var bakView: UIView = {
        var view = UIView()
        return view
    }()
    
    // 横向滑动 Collectionview
    lazy private var shopItemCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 300, height: 284)
        flowLayout.sectionInset = UIEdgeInsets(top: 25, left: 20, bottom: 27, right: 20)
        flowLayout.minimumInteritemSpacing = 15
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellWithClass: ShopItemAdCollectionViewCell.self)
        return collectionView
    }()
    
    override func initialViews() {
        super.initialViews()
        addSubview(bakView)
        bakView.addSubview(shopItemCollectionView)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        
        bakView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        shopItemCollectionView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(336)
        }
    }

    override func updateViews() {
        super.updateViews()
        shopItemCollectionView.reloadData()
    }
}

extension ShopItemAdContainerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let vm = viewModel?.datas[safe: indexPath.row] as? ShopItemAdCollectionViewCellModel {
            let cell = collectionView.dequeueReusableCell(withClass: ShopItemAdCollectionViewCell.self, for: indexPath)
            cell.viewModel = vm
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.datas.count ?? 0
    }
}

extension ShopItemAdContainerTableViewCell: UICollectionViewDelegate {}

class ShopItemAdContainerTableViewCellModel: FalcViewModel<NSObject> {

}
