//
//  Food.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation


// MARK: - DaeguFood 구조체
struct DaeguFood: Codable {
    let status, total: String?
    let data: [FoodData]
}

// MARK: - FoodData 구조체
struct FoodData: Codable, Hashable {
   let name, descriotion: String?

    enum CodingKeys: String, CodingKey {
        case name = "FD_CS"
        case descriotion = "SMPL_DESC"
    }
}

class FoodStore: ObservableObject {
    @Published var foods: [FoodData] = []
}
