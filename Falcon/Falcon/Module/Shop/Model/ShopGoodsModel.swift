//
//  ShopGoodsModel.swift
//  Falcon
//
//  Created by piggy on 2019/10/13.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import ObjectMapper

/// 商品详情Model
class ShopGoodsModel:FalcViewModel<NSObject>, Mappable {

    public var id: Int?
    public var previousPriceText: String = ""
    public var nowPriceText: String = ""
    
    public var purchaseURL: String?
    public var markdown: String?
    
    public var price: Int = 0 {
        didSet {
            nowPriceText = "RMB \(price)"
        }
    }
    
    public var originPrice: Int = 0 {
        didSet {
            previousPriceText = "RMB \(originPrice)"
        }
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        originPrice <- map["originPrice"]
        price <- map["price"]
        markdown <- map["detail"]
        purchaseURL <- map["purchaseURL"]
    }
}
