//
//  MyGraMeRouter.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import Foundation
import UIKit

import Moya

enum MyGraMeRouter {
    case getLogs
}

extension MyGraMeRouter: TargetType{
    var baseURL: URL {
        return URL(string: "http://43.200.22.42:3000")!
    }
    
    var path: String {
        switch self {
        case .getLogs:
            return "/logs"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLogs:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getLogs:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        NetworkConstant.hasTokenHeader
    }
    
    
}
