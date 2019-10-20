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

public class SerieListEntity:Mappable {
    internal var results: [SerieEntity]?
    internal var page: Int?
    internal var totalPages: Int?
    
    required public init?(map: Map) {
        mapping(map: map)
    }
    
    public func mapping(map: Map) {
        results <- map[RESULTS]
        page <- map[PAGE]
        totalPages <- map[TOTALPAGES]
    }
}

private let ID = "id"
private let TITLE = "name"
private let VOTEAVERAGE = "vote_average"
private let POSTER = "poster_path"
private let FIRSTAIRDATE = "first_air_date"
private let OVERVIEW = "overview"
private let GENRES = "genres"

public class SerieEntity:Mappable {
    internal var id: Int?
    internal var title: String?
    internal var voteAverage: Double?
    internal var poster: String?
    internal var firstAirDate: String?
    internal var overview: String?
    internal var genres: [Genre]?
    
    required public init?(map:Map) {
        mapping(map: map)
    }
    
    public func mapping(map:Map){
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

public class GenreEntity:Mappable {
    internal var name: String?
    
    required public init?(map:Map) {
        mapping(map: map)
    }
    
    public func mapping(map:Map){
        name <- map[GENRENAME]
    }
}
