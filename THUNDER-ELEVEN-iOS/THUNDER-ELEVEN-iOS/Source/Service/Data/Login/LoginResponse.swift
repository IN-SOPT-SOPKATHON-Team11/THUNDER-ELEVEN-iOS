//
//  LoginResponse.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let message: String
    let data: Login
}

// MARK: - DataClass
struct Login: Codable {
    let accessToken: String
}
