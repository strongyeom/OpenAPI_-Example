//
//  DaegoMainView.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import SwiftUI

struct DaegoMainView: View {
    @ObservedObject var foodStore: FoodStore = FoodStore()
    var url = "https://www.daegufood.go.kr/kor/api/Alley.html?mode=json"
    var body: some View {
        List {
            ForEach(foodStore.foods, id: \.self) {
                food in
                VStack(alignment: .leading) {
                    Text("\(food.name ?? "")")
                    Text("\(food.descriotion ?? "")")
                }
            }
        }
        .onAppear {
            Task {
                foodStore.foods = try await RWebSerice().fetch(url: url)
            }
        }
    }
}

struct DaegoMainView_Previews: PreviewProvider {
    static var previews: some View {
        DaegoMainView()
    }
}
