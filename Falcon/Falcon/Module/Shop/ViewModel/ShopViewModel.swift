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

//    override func initialDatas() {
//        super.initialDatas()
//        let shopItemAdContainerModel = ShopItemAdContainerTableViewCellModel()
//        let cm = ShopItemAdCollectionViewCellModel()
//        cm.titleText = "SwiftGG 专属优惠"
//        cm.typeText = "Reveal 21"
//        cm.goodsImage = "https://img.mukewang.com/szimg/5d1032ab08719e0906000338-360-202.jpg"
//        shopItemAdContainerModel.datas.append(cm)
//        shopItemAdContainerModel.datas.append(cm)
//        shopItemAdContainerModel.datas.append(cm)
//        datas.append(shopItemAdContainerModel)
//
//        let shopItem = ShopItemTableViewCellModel()
//        shopItem.titleText = "GGTalk 字幕合集书"
//        shopItem.descText = "包含 110 期节目的所有字幕合集，附赠 MM 手绘小鸡贴纸 2 张。还是麻辣味道。"
//        shopItem.goodsImage = "https://swift.gg/img/logo_new.png"
//        shopItem.price = 133
//        for _ in 0 ..< 10 {
//            datas.append(shopItem)
//        }
//    }
    
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
