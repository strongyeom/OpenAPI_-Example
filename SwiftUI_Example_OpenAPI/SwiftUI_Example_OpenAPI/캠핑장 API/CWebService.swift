//
//  WebService.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

class CWebService {
    
    func fetchData(url: String) async throws -> [Camping] {
        
        guard let url = URL(string: url) else { return [] }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let datas = try JSONDecoder().decode([Camping].self , from: data)

        return datas
        
    }
    
}

