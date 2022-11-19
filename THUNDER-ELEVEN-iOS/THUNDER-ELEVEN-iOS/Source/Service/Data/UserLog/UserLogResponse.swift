// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct UsersLogResponseDto: Codable {
    let status: Int
//    let success: Bool
    let message: String
    let data: UserLogs
}

// MARK: - DataClass
struct UserLogs: Codable {
    let senderNickname: String
    let logs: [Log]
}

// MARK: - Log
struct Log: Codable {
    let type: Int
    let impression: Impression
    let comment: String
}

// MARK: - Impression
struct Impression: Codable {
    let tag, animal: String
}
