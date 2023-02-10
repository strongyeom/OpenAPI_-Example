//
//  MovieMainView.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import SwiftUI

struct MovieMainView: View {
    @ObservedObject var moviesStore: Movies = Movies(movies: [])
    
    var mwebService = MWebService()
    
    var body: some View {
        List {
            ForEach(moviesStore.movies, id: \.self){
                movie in VStack {
                    Text("\(movie.movieNm)")
                }
            }
        }.onAppear {
            Task {
                moviesStore.movies = try await
                    mwebService.fetchData(url: URLS.url)
            }
        }
    }
}

struct MovieMainView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMainView()
    }
}
