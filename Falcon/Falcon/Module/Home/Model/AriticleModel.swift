//
//  AriticleModel.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/9/6.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticleModel: Mappable {
    var id: Int?
    var title: String?
    var preface: String?
    var category: String?
    var publishDate: String?
    var imageURL: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        preface <- map["preface"]
        category <- map["category"]
        publishDate <- map["publishDate"]
        imageURL <- map["imageURL"]
    }
}

class ArticleDetailModel: Mappable {
    var id: Int?
    var title: String?
    var body: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}
