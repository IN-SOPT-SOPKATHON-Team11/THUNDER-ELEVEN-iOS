//
//  NetworkConstant.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 양정연 on 2022/11/18.
//

import Foundation

struct NetworkConstant {
    
    static let noTokenHeader = ["Content-Type": "application/json"]
    static var hasMultipartHeader = ["Content-Type": "multipart/form-data; boundary=<calculated when request is sent>"]
    static let urlencodedHeader = ["Content-Type": "application/x-www-form-urlencoded"]
    
}
