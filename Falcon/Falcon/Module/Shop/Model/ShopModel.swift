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
class ShopModel: Mappable {
    var banner: [ShopItemAdCollectionViewCellModel]?
    var list: [ShopItemTableViewCellModel]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        banner <- map["banner"]
        list <- map["list"]
    }
}
