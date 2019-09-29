//
//  ArticleViewModel.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/7/23.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ArticleViewModel: FalcViewModel<ArticleDetailModel> {

    public var id: Int?

    weak var vmDelegate: ViewModelDelegate?

    override func initialDatas() {
        super.initialDatas()
    }

    override func updateDatas() {
        super.updateDatas()
        vmDelegate?.updateViewAfterChangeData()
    }

    func fetchData() {
        guard let id = id else { return }
        let URL = "http://api.swift.gg/app/post/\(id)"
        Alamofire.request(URL).responseObject { [unowned self] (response: DataResponse<GeneralResponse<ArticleDetailModel>>) in
            let generalResponse = response.result.value
            if let success = generalResponse?.success, success {
                if let articleDetailModel = generalResponse?.results {
                    if let markdown = articleDetailModel.body, let title = articleDetailModel.title {
                        let imageLink = "](/img/articles/"
                        let addHost = "](https://swift.gg/img/articles/"
                        let replaced = markdown.replacingOccurrences(of: imageLink, with: addHost)
                        let result = "# \(title)\n" + replaced
                        articleDetailModel.body = result
                    }
                    self.data = articleDetailModel
                }
            } else {
                print("wrong! \(generalResponse?.message ?? "")")
            }
        }
    }
}
