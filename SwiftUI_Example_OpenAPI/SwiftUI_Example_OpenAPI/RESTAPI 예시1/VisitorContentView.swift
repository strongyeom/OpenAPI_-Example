//
//  VisitorContentView.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import SwiftUI

struct VisitorContentView: View {
    @ObservedObject var network = RequestAPI.shared
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(network.posts, id:\.self) { result in
                    VStack(alignment: .leading) {
                        Group {
                            Text("월 : ") + Text(result.date ?? "")
                        }
                       
                        Text(result.managementName ?? "")
                        Group {
                            Text(result.person ?? "") + Text("명")
                        }
                       
                    }
                   
                }
            }
            .onAppear {
                network.fetchData()
            }
        }
    }
}

struct VisitorContentView_Previews: PreviewProvider {
    static var previews: some View {
        VisitorContentView()
    }
}
