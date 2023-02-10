//
//  WebService.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

class WebService {
    
    // throws 문제가 생기면 멈출거야
    func fetchData(url: String) async throws -> [GolfPlace] {
        guard let url = URL(string: url) else { return [] }
        print(url)
        do {
            // await 이 문장이 끝날때 까지 기다려줘 ( await 쓰려면 앞에 async 붙여야함 )
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            let golfs = try JSONDecoder().decode(Golf.self, from: data)
            print("\(golfs)")
            return golfs.golfPlace
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
