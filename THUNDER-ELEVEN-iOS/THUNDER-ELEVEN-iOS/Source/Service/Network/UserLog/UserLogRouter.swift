//
//  UserLogRouter.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import Foundation
import Moya

enum UserLogRouter{
    case getUsersImpressionLog
}

extension UserLogRouter: TargetType{
    var baseURL: URL {
        return URL(string: "http://43.200.22.42:3000")!
    }
    
    var path: String {
        return "/logs/comments"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
