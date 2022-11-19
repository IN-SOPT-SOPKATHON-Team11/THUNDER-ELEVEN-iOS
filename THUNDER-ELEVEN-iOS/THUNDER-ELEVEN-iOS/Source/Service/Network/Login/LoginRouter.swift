//
//  LoginRouter.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import Foundation

import Moya

enum LoginRouter {
    case postLogin(param: LoginRequest)
}

extension LoginRouter: TargetType {
    var baseURL: URL {
        return URL(string: "http://43.200.22.42:3000")!
    }
    
    var path: String {
        switch self {
        case .postLogin(_):
            return "/auth/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postLogin(_):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postLogin(let param):
            return .requestParameters(parameters: ["nickname": param.nickname, "password": param.password], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postLogin:
            return NetworkConstant.noTokenHeader
        }
    }
}
