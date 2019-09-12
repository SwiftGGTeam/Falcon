//
//  TalkItemViewModel.swift
//  Falcon
//
//  Created by Rickey on 2019/9/12.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import SWXMLHash

class TalkItemViewModel: FalcViewModel<NSObject> {
    
    public var title = ""
    public var episode = 0
    public var link = ""
    public var pubDate = ""
    public var desc = ""
    public var detailUrl = ""
    public var guid = ""
    public var duration = ""
    public var summary = ""
    public var image = ""
    public var keywords = ""
    public var explicit = ""
    
    convenience init(node: XMLIndexer) {
        self.init()
        if let title = node["title"].element?.text { self.title = title }
        if let desc = node["description"].element?.text { self.desc = desc }
        if let date = node["pubDate"].element?.text { self.pubDate = date }
        if let duration = node["itunes:duration"].element?.text { self.duration = duration }
    }
    
}
