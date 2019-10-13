//
//  ShopDetailViewModel.swift
//  Falcon
//
//  Created by piggy on 2019/9/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

/// 商品详情ViewModel
class ShopDetailViewModel: FalcViewModel <ViewModel> {

    public var id: Int?
    
    required init(id: Int) {
        self.id = id
        super.init()
    }
    
    override func initialDatas() {
        super.initialDatas()
        fetchData { [unowned self] in
            guard let data = self.data as? ShopGoodsModel else { return }
            self.delegate?.modelChanged([data])
        }
    }
    
    func fetchData(_ handleDone: @escaping () -> Void) {
        guard let id = id else { return }
        Alamofire.request(Router.goodsDetail(id)).responseObject {
            (response: DataResponse<GeneralResponse<ShopGoodsModel>>) in
            let generalResponse = response.result.value
            guard let success = generalResponse?.success, success else {
                print("General Response Error! \(generalResponse?.message ?? "")")
                return
            }
            guard let goodsModel = generalResponse?.results else {
                    print("ORM Error: Can not get goods models!")
                    return
            }
            if let markdown = goodsModel.markdown {
                let imageLink = "](/img/articles/"
                let addHost = "](https://swift.gg/img/articles/"
                let replaced = markdown.replacingOccurrences(of: imageLink, with: addHost)
                goodsModel.markdown = replaced
            }
            
            self.data = goodsModel
            handleDone()
        }
    }
}
