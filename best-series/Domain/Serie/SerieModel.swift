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
    let firstAirDate: Date
    let overview: String
    //let genres: [Genre]?
    
    init(id: Int=0, title: String="", voteAverage: Double=0, poster: String="", firstAirDate: Date=Date(), overview: String="") {
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.poster = poster
        self.firstAirDate = firstAirDate
        self.overview = overview
        //self.genres = genres
    }
}

public class Genre {
    let name: String?
    
    init(name: String) {
        self.name = name
    }
}
