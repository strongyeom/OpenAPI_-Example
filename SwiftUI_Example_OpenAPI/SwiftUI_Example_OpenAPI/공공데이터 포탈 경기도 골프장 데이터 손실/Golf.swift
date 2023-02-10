//
//  Golf.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation
// MARK: - TodosResponse
struct Golf: Codable, Hashable {
    let golfPlace: [GolfPlace]

    enum CodingKeys: String, CodingKey {
        case golfPlace = "GolfPlace"
    }
}

// MARK: - GolfPlace
struct GolfPlace: Codable, Hashable {
    let head: [Head]
    let row: [Row]
}

// MARK: - Head
struct Head: Codable, Hashable {
    let listTotalCount: Int?
    let result: Result?
    let apiVersion: String?

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case apiVersion = "api_version"
    }
}

// MARK: - Result
struct Result: Codable, Hashable {
    let code, message: String

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Codable,Hashable {
    var sigunCD: String
    var sigunNm: String
    var bizplcNm: String
    var licensgDe: String
   
    enum CodingKeys: String, CodingKey {
        case sigunCD = "SIGUN_CD"
        case sigunNm = "SIGUN_NM"
        case bizplcNm = "BIZPLC_NM"
        case licensgDe = "LICENSG_DE"
    }
}

class GolfStore: ObservableObject {
    @Published var golfs: [GolfPlace] = []
}
