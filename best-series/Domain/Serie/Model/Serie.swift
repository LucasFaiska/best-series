//
//  Serie.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation
import ObjectMapper

private let RESULTS = "results"
private let PAGE = "page"
private let TOTALPAGES = "total_pages"

class SerieList:Mappable {
    internal var results: [Serie]?
    internal var page: Int?
    internal var totalPages: Int?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        results <- map[RESULTS]
        page <- map[PAGE]
        totalPages <- map[TOTALPAGES]
    }
}

private let ID = "id"
private let TITLE = "original_name"
private let VOTEAVERAGE = "vote_average"
private let POSTER = "poster_path"
private let FIRSTAIRDATE = "first_air_date"
private let OVERVIEW = "overview"
private let GENRES = "genres"

class Serie:Mappable {
    internal var id: Int?
    internal var title: String?
    internal var voteAverage: Double?
    internal var poster: String?
    internal var firstAirDate: Date?
    internal var overview: String?
    internal var genres: [Genre]?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        voteAverage <- map[VOTEAVERAGE]
        poster <- map[POSTER]
        firstAirDate <- map[FIRSTAIRDATE]
        overview <- map[OVERVIEW]
        genres <- map[GENRES]
    }
}

private let GENRENAME = "name"

class Genre: Codable {
    internal var name: String
    
    func mapping(map:Map){
        name <- map[GENRENAME]
    }
}
