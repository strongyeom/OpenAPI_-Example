//
//  GolfMainView.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import SwiftUI

struct GolfMainView: View {
    @ObservedObject var golfStore: GolfStore = GolfStore()
    
    let url = "https://openapi.gg.go.kr/GolfPlace?key=412e18675f3f4cd6b7d05b1598178e02&type=json&psize=1"
    
    var body: some View {
        List {
            ForEach(golfStore.golfs, id:\.self) { golf in
                ForEach(golf.row, id: \.self) {
                    golfInfo in
                    VStack {
                        Text("\(golfInfo.sigunCD)")
                    }
                }
                
            }
        }
        .onAppear {
            Task {
                golfStore.golfs = try await WebService().fetchData(url: url)
                
            }
        }
        
    }
}

struct GolfMainView_Previews: PreviewProvider {
    static var previews: some View {
        GolfMainView()
    }
}
