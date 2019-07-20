//
//  HomeViewModel.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

class HomeViewModel: FalcViewModel<ViewModel> {
    
    override func initialDatas() {
        super.initialDatas()
        var cm = HomeItemTableViewCellModel()
        cm.titleText = "SwiftGG 的第一篇文章"
        datas.append(cm)
        datas.append(HomeItemTableViewCellModel())
        datas.append(HomeItemTableViewCellModel())
    }
}
