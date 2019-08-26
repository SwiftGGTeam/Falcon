//
//  EventViewModel.swift
//  Falcon
//
//  Created by Q on 2019/8/20.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit

/// 活动模块
class EventViewModel: FalcViewModel<ViewModel> {

    override func initialDatas() {
        super.initialDatas()
        let eventItem = EventItemCollectionViewCellModel()
        eventItem.backgroundImage = "https://img.mukewang.com/szimg/5d1032ab08719e0906000338-360-202.jpg"
        eventItem.titleText = "互联网寒冬来袭\n移动开发者如何破局"
        eventItem.statusText = "开放报名中"
        eventItem.locationText = "上海虹口区上海市天水路172号金融街海伦中心B座"
        eventItem.timeText = "2019-04-20  13:00 ~ 18:00"
        for _ in 0 ..< 10 {
            datas.append(eventItem)
        }
    }
    
}
