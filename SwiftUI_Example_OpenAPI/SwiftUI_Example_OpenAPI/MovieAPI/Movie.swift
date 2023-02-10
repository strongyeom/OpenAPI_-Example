//
//  Movie.swift
//  SwiftUI_Example_OpenAPI
//
//  Created by 염성필 on 2023/02/10.
//

import Foundation

struct BoxOffice: Codable, Hashable {
    var boxOfficeResult: WeeklyBoxOffice
}

struct WeeklyBoxOffice: Codable, Hashable {
    var weeklyBoxOfficeList: [WeeklyBoxOfficeList]
    var showRange: String
}

struct WeeklyBoxOfficeList: Codable, Hashable {
    var rank: String        // 순위
    var movieNm: String     // 영화 이름
    var openDt: String      // 개봉일
    var salesAmt: String    // 매출
    var salesAcc: String    // 누적 매출액
    var audiCnt: String     // 관객수
    var audiAcc: String     // 누적 관객수
}


class Movies : ObservableObject {
    
    @Published var movies: [WeeklyBoxOfficeList]
    
    init (movies: [WeeklyBoxOfficeList] = []) {
        self.movies = movies
    }
}
