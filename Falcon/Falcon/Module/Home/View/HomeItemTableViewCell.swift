//
//  HomeItemTableViewCell.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

class HomeItemTableViewCell: FalcTableViewCell<HomeItemTableViewCellModel> {
    private var bakView: UIView = {
        var view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func initialViews() {
        super.initialViews()
        addSubview(bakView)
    }
    
    override func initialLayouts() {
        super.initialLayouts()
        bakView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}


class HomeItemTableViewCellModel: FalcViewModel<NSObject> {
    
}
