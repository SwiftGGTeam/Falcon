//
//  EventViewModel.swift
//  Falcon
//
//  Created by Q on 2019/8/20.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

/// 活动模块
class EventViewModel: FalcViewModel<ViewModel> {

    override func initialDatas() {
        super.initialDatas()
        fetchData {
        }
    }
    
    func fetchData(_ handleDone: @escaping () -> Void) {
        Alamofire.request(Router.events).responseObject {
            (response: DataResponse<GeneralResponse<EventModel>>) in
            let generalResponse = response.result.value
            guard let success = generalResponse?.success, success else {
                print("General Response Error! \(generalResponse?.message ?? "")")
                return
            }
            guard let eventModel = generalResponse?.results,
                let eventModels = eventModel.eventModels else {
                    print("ORM Error: Can not get homeModel!")
                    return
            }
            self.datas = eventModels
            handleDone()
        }
    }
    
}
