//
//  HomeViewModel.swift
//  Falcon
//
//  Created by Harry Duan on 2019/7/15.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol ViewModelDelegate: class {
    func updateViewAfterChangeData()
}

protocol HomeViewModelDelegate: class {
    func stopRefresh()
}

class HomeViewModel: FalcViewModel<ViewModel> {
    
    weak var vmDelegate: ViewModelDelegate?
    weak var hvmDelegate: HomeViewModelDelegate?
    
    private var currentPage = 1
    private var pageSize = 10
    
    override func initialDatas() {
        super.initialDatas()
        fetchData()
    }
    
    override func updateDatas() {
        super.updateDatas()
        vmDelegate?.updateViewAfterChangeData()
    }
    
    func fetchData() {
        Alamofire.request(Router.articles(currentPage, pageSize)).responseObject {
            [weak self] (response: DataResponse<GeneralResponse<HomeModel>>) in
            let generalResponse = response.result.value
            guard let success = generalResponse?.success, success else {
                print("General Response Error! \(generalResponse?.message ?? "")")
                return
            }
            guard let homeModel = generalResponse?.results,
                let articles = homeModel.articleModel else {
                    print("ORM Error: Can not get homeModel!")
                    return
            }
            var cellModelArray = [HomeItemTableViewCellModel]()
            for article in articles {
                let cellModel = HomeItemTableViewCellModel()
                cellModel.data = article
                cellModelArray.append(cellModel)
            }
            guard let self = self else { return }
            self.hvmDelegate?.stopRefresh()
            self.datas.append(contentsOf: cellModelArray)
            self.currentPage += 1
        }
    }
        
    func refreshData() {
        currentPage = 1
        datas.removeAll()
        fetchData()
    }
    
}
