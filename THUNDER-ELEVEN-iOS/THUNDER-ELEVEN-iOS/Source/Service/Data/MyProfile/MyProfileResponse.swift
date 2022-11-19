// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct MyProfileResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: UserInfo
}

// MARK: - DataClass
struct UserInfo: Codable {
    let user: Name
    let firstImpression, currentImpression: TImpression
}

// MARK: - TImpression
struct TImpression: Codable {
    let tag, animal: String
}

// MARK: - User
struct Name: Codable {
    let nickname: String
}
