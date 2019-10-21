//
//  SerieModel.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

struct SerieList {
    let results: [Serie]?
    let page: Int?
    let totalPages: Int?
    
    init(results: [Serie]?, page: Int?, totalPages: Int?) {
        self.results = results
        self.page = page
        self.totalPages = totalPages
    }
}

struct Serie: Identifiable {
    let id: Int
    let title: String
    let voteAverage: Double
    let poster: String
    let firstAirDate: String
    let overview: String
    let genres: [Genre]
    
    init(id: Int=0, title: String="", voteAverage: Double=0, poster: String="", firstAirDate: String="", overview: String="", genres: [Genre]=[]) {
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.poster = poster
        self.firstAirDate = firstAirDate
        self.overview = overview
        self.genres = genres
    }
    
    var firstAirYear: String {
        return String(self.firstAirDate.prefix(4))
    }
    
    var posterUrl: URL? {
        return URL(string: poster)
    }
}

struct Genre: Identifiable {
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
