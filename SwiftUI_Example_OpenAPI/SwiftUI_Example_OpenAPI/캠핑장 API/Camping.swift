//
//  Camping.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

// MARK: - TodosResponseElement
struct Camping: Codable, Hashable {
    let city, campingName, dataStdDe: String?
    let refineRoadnmAddr, refineLotnoAddr, refineWgs84Lat: String?
    let refineWgs84Logt: String?

    enum CodingKeys: String, CodingKey {
        case city = "SIGUN_NM"
        case campingName = "SI_DESC"
        case dataStdDe = "DATA_STD_DE"
        case refineRoadnmAddr = "REFINE_ROADNM_ADDR"
        case refineLotnoAddr = "REFINE_LOTNO_ADDR"
        case refineWgs84Lat = "REFINE_WGS84_LAT"
        case refineWgs84Logt = "REFINE_WGS84_LOGT"
    }
}

class CampingStore: ObservableObject {
    @Published var campings: [Camping] = []
}
