//
//  RequestAPI.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

class RequestAPI: ObservableObject {
    
    @Published var posts: [VisitorData] = []
    // 싱글톤으로 만들어주기
    static let shared = RequestAPI()
    private init() { }
    
    private let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    func fetchData() {
        
       // guard let apiKey = apiKey else { return }
        //UQybVf%2FBVAsYaLeP9xLFftf6XvnhuY3nWPU72kKjfSPporofcAGn6UQp%2BG9ftv2cI9VQxA9Fq0B%2FtIWxZ2lavg%3D%3D
        
        guard let url = URL(string: "https://api.odcloud.kr/api/3038648/v1/uddi:66afa51d-2cc0-4d11-a039-fe70c72f6572_201909101852?page=1&perPage=10&serviceKey=UQybVf%2FBVAsYaLeP9xLFftf6XvnhuY3nWPU72kKjfSPporofcAGn6UQp%2BG9ftv2cI9VQxA9Fq0B%2FtIWxZ2lavg%3D%3D") else { return }
        
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            
            do {
                let apiResponse = try JSONDecoder().decode(Visitor.self, from: data)
                DispatchQueue.main.async {
                    guard let data = apiResponse.data else { return }
                    self.posts = data
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
