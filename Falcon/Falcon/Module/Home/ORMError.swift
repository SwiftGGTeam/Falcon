
//
//  ORMError.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/9/10.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Foundation

enum FalcError: Error {
    case responseError(message: String?)
}

extension FalcError : CustomStringConvertible {
    var description: String {
        switch self {
        case .responseError(let message):
            return "General Response Error! \(message ?? "")"
        }
    }
}
