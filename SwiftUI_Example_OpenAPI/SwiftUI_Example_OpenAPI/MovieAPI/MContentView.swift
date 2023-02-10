//
//  MContentView.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import SwiftUI

struct MContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: MovieMainView()) {
                Text("파싱 해보자고")
            }
        }
    }
}

struct MContentView_Previews: PreviewProvider {
    static var previews: some View {
        MContentView()
    }
}
