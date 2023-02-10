//
//  WebService.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

class RWebSerice {
    
    //throws 문제가 생기면 멈출거야, fetch 함수로 url를 받아와서 비동기적으로 실행 리턴값 [FoodData]
    func fetch(url: String) async throws -> [FoodData] {
        
        //매개변수로 들어오는 url를 옵셔널 바인딩 해준다.
        guard let url = URL(string: url) else { return [] }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let datas = try JSONDecoder().decode(DaeguFood.self, from: data)
            print(datas)
            return datas.data
        } catch {
            print(error.localizedDescription)
            return []
        }
        
    }
}
