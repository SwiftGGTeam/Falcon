//
//  ShopViewModel.swift
//  Falcon
//
//  Created by Q on 2019/7/27.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

// 商店模块 ViewModel
class ShopViewModel: FalcViewModel<ViewModel> {
    
    override func initialDatas() {
        super.initialDatas()
        fetchData {
        }
    }
    
    func fetchData(_ handleDone: @escaping () -> Void) {
        Alamofire.request(Router.shopItems).responseObject {
            (response: DataResponse<GeneralResponse<ShopModel>>) in
            let generalResponse = response.result.value
            guard let success = generalResponse?.success, success else {
                print("General Response Error! \(generalResponse?.message ?? "")")
                return
            }
            guard let shopModel = generalResponse?.results,
                let bannerModels = shopModel.banner else {
                    print("ORM Error: Can not get banner models!")
                    return
            }
            let shopItemAdContainerModel = ShopItemAdContainerTableViewCellModel()
            shopItemAdContainerModel.datas.append(contentsOf:bannerModels)
            
            guard let goodList = shopModel.list else {
                    print("ORM Error: Can not get goods models!")
                    return
            }
            self.datas.append(shopItemAdContainerModel)
            self.datas.append(contentsOf:goodList)
            self.updateDatas()
            handleDone()
        }
    }
}
