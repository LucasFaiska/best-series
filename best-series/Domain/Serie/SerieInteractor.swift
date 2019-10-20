//
//  SerieInteractor.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

class SerieInteractor: SerieInteractorProtocol {
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
                              poster: serieEntity.poster ?? "",
                              firstAirDate: serieEntity.firstAirDate ?? Date(),
                              overview: serieEntity.overview ?? "")
            results.append(serie)
        }
        return SerieList(results: results, page: entity.page, totalPages: entity.totalPages)
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
}
