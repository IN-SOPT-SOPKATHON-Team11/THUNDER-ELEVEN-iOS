//
//  StatusHandler.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by 양정연 on 2022/11/18.
//

import Foundation

protocol StatusHandler {
    var status: Int { get }
    var message: String? { get }
    var statusCase: StatusCase? { get }
}
