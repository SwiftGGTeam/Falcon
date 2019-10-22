//
//  EventModel.swift
//  Falcon
//
//  Created by piggy on 2019/9/30.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import ObjectMapper

/// 活动model
class EventModel: Mappable {
    var page: Int?
    var size: Int?
    var total: Int?
    var eventModels: [EventItemCollectionViewCellModel]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        page <- map["pageBean.page"]
        size <- map["pageBean.size"]
        total <- map["pageBean.total"]
        eventModels <- map["items"]
    }
    
}
