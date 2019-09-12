//
//  TalkListViewModel.swift
//  Falcon
//
//  Created by Rickey on 2019/9/12.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation
import SWXMLHash

class TalkListViewModel: FalcViewModel<ViewModel> {

    public func setNewData(xmlList: [XMLIndexer]) {
        datas = xmlList.map {
            let item = TalkItemViewModel()
            if let title = $0["title"].element?.text { item.title = title }
            if let desc = $0["description"].element?.text { item.desc = desc }
            if let date = $0["pubDate"].element?.text { item.pubDate = date }
            if let duration = $0["itunes:duration"].element?.text { item.duration = duration }
            return item
        }
    }
    
}
