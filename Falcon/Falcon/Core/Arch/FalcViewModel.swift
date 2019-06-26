//
//  FalcViewModel.swift
//  Falcon
//
//  Created by Harry Duan on 2019/6/26.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation

public protocol BasicViewDelegate {
    func modelChanged(_ models: [Any])
}

extension BasicViewDelegate {
    func modelChanged(_ models: [Any]) {}
}

public protocol BasicViewModel {
    func initialDatas()
    func updateDatas()
}

public protocol ViewModel: BasicViewModel {
    associatedtype Model
    var datas: [Model] { get set }
    var delegate: BasicViewDelegate? { get set }
}


