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
        datas = xmlList.map { TalkItemViewModel(node: $0) }
    }
    
}
