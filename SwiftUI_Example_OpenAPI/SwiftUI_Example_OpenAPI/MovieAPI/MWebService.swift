//
//  WebService.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

class MWebService {
    func fetchData(url: String) async throws -> [WeeklyBoxOfficeList] {
        
        guard let url = URL(string: url) else { return [] }
        
       
        let datas = try await URLSession.shared.data(from: url)
        
       
        let movies = try JSONDecoder().decode(BoxOffice.self, from: datas.0)
        print("영화 배열 : \(movies)")
        return movies.boxOfficeResult.weeklyBoxOfficeList
       
    }
}
