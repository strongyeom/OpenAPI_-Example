//
//  CampingMainView.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import SwiftUI

struct CampingMainView: View {
    @ObservedObject var campingStore = CampingStore()
    let url = "https://mocki.io/v1/2f333e3e-76af-46f8-9d96-919c14dafacd"
    var body: some View {
       
        List {
            ForEach(campingStore.campings, id: \.self) {
                camping in
                Text(camping.campingName ?? "")
            }
        }
        .onAppear {
            Task {
                campingStore.campings = try await CWebService().fetchData(url: url)
            }
        }
    }
}

struct CampingMainView_Previews: PreviewProvider {
    static var previews: some View {
        CampingMainView()
    }
}
