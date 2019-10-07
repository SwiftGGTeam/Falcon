//
//  ShopModel.swift
//  Falcon
//
//  Created by piggy on 2019/10/7.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import ObjectMapper

/// 商店网络返回model
class ShopModel: Mapper {
    var banner: [ShopItemTableViewCellModel]?
    var list: [ShopItemAdCollectionViewCellModel]?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        page <- map["pageBean.page"]
        size <- map["pageBean.size"]
        total <- map["pageBean.total"]
        eventModels <- map["items"]
    }
}
