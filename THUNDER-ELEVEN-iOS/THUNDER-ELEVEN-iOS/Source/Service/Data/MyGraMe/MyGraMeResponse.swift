//
//  MyGraMeResponse.swift
//  THUNDER-ELEVEN-iOS
//
//  Created by Mac Book Pro on 2022/11/20.
//

import Foundation


// MARK: - MyGraMeResponse
struct MyGraMeResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let logs: [logs]
}

// MARK: - Log
struct logs: Codable {
    let senderNickname: String
    let firstImpression, currentImpression: TImpression
}

// MARK: - TImpression
struct TImpression: Codable {
    let tag, animal: String
}


