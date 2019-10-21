//
//  SerieInteractor.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

class SerieInteractor: SerieInteractorProtocol {
    let POSTER_BASE_URL:String = "https://image.tmdb.org/t/p/w342"
    private let repository: SerieRepository
    
    init(serieRepository: SerieRepository) {
        self.repository = serieRepository
    }
    
    internal func mapEntityToModel(entity: SerieListEntity) -> SerieList {
        var results: [Serie] = Array()
        for serieEntity in entity.results! {
            let serie = Serie(id: serieEntity.id ?? 0,
                              title: serieEntity.title ?? "",
                              voteAverage: serieEntity.voteAverage ?? 0,
                              poster: POSTER_BASE_URL + (serieEntity.poster ?? ""),
                              firstAirDate: serieEntity.firstAirDate ?? "",
                              overview: serieEntity.overview ?? "")
            results.append(serie)
        }
        return SerieList(results: results, page: entity.page ?? 0, totalPages: entity.totalPages ?? 0)
    }
    
    func fetchBestSeries(page: Int, and onCompletion: @escaping (SerieList?) -> Void, onError: @escaping () -> Void) {
        repository.getBestSeriesList(page: page, and: {
            serieListEntity in
            if let entity = serieListEntity {
                onCompletion(self.mapEntityToModel(entity: entity))
            } else {
                onCompletion(SerieList(results: Array(), page: 0, totalPages: 0))
            }
        }, onError: onError)
    }
    
    internal func mapEntityToModel(entity: SerieEntity) -> Serie {
        var genres: [Genre] = Array()
        for genre in entity.genres! {
            genres.append(Genre(id: genre.id ?? 0, name: genre.name ?? ""))
        }

        var similarSeries: SerieList
        if let similarSeriesEntity = entity.similarSeries {
            similarSeries = mapEntityToModel(entity: similarSeriesEntity)
        } else {
            similarSeries = SerieList()
        }
        
        return Serie(id: entity.id ?? 0,
                     title: entity.title ?? "",
                     voteAverage: entity.voteAverage ?? 0,
                     poster: POSTER_BASE_URL + (entity.poster ?? ""),
                     firstAirDate: entity.firstAirDate ?? "",
                     overview: entity.overview ?? "",
                     genres: genres,
                     similarSeries: similarSeries)
    }
    
    func fetchSerieDetail(serieId: Int, and onCompletion: @escaping (Serie?) -> Void, onError: @escaping () -> Void) {
        repository.getSerieDetail(serieId: serieId, and: {
            serieEntity in
            if let entity = serieEntity {
                onCompletion(self.mapEntityToModel(entity: entity))
            } else {
                onCompletion(Serie())
            }
        }, onError: onError)
    }
}
