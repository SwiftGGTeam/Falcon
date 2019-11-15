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
    
    // MARK: Data Elements
    
    weak var vmDelegate: ViewModelDelegate?
    
    // MARK: Life-Cycle Methods
    
    override func updateDatas() {
        super.updateDatas()
        
        vmDelegate?.updateViewAfterChangeData()
    }
    
    // MARK: Public Methods

    public func setNewData(xmlList: [XMLIndexer]) {
        datas = xmlList.map { TalkItemViewModel(node: $0) }
    }
    
}
