//
//  TennisStore.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

class TennisStore: ObservableObject {
    @Published var tennis: [Tennis]
    
    init( tennis: [Tennis] = [] ) {
        self.tennis = tennis
    }
}
