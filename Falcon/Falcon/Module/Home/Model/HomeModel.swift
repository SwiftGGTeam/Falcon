//
//  HomeModel.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/9/5.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation
import ObjectMapper

class GeneralResponse<T: Mappable>: Mappable {
    var success: Bool?
    var message: String?
    var results: T?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        results <- map["results"]
    }
    
}

class HomeModel: Mappable {
    var page: Int?
    var size: Int?
    var total: Int?
    var articleModel: [ArticleModel]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        page <- map["pageBean.page"]
        size <- map["pageBean.size"]
        total <- map["pageBean.total"]
        articleModel <- map["items"]
    }
}
