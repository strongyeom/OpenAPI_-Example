//
//  Tennis.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

struct Tennis: Codable, Identifiable  {
    var id: String
    var phoneNumber: String
    var name: String
    var date: String
    var address: String
    
    enum CodingKeys: String, CodingKey, Codable {
        case id = "연번"
        case phoneNumber = "전화번호"
        case name = "업체명"
        case date = "데이터기준일자"
        case address = "소재지"
    }
}
