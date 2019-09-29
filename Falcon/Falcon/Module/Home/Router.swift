//
//  Router.swift
//  Falcon
//
//  Created by Jianing Wang on 2019/9/10.
//  Copyright © 2019 Harry Duan. All rights reserved.
//

import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "http://api.swift.gg"
    
    case articles(Int, Int)
    case article(Int)
    case events
    
    private var method: HTTPMethod {
        switch self {
        case .articles:
            return .get
        case .article:
            return .get
        case .events:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .articles:
            return "/app/posts"
        case .article(let id):
            return "/app/post/\(id)"
        case .events:
            return "/app/events"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .articles(let page, let size):
            return ["page": page, "size": size]
        case .article:
            return nil
        case .events:
            return nil
        }
    }
    
    private var encoding: ParameterEncoding {
        switch self {
        case .articles:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
