//
//  PersonMove.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

// MARK: - TodosResponse
struct Visitor: Codable, Hashable {
    let currentCount: Int?
    let data: [VisitorData]?
    let matchCount, page, perPage, totalCount: Int?
}

// MARK: - Datum
struct VisitorData: Codable, Hashable {
    let managementName: String?
    let person : String?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case managementName = "관리기관명"
        case person = "대장간마을(내국인)"
        case date = "월"
    }
}

