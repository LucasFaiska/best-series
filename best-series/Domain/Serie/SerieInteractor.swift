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
    
    func fetchBestSeries(page: Int, and onCompletion: @escaping (SerieList?) -> Void, onError: @escaping () -> Void) {
        repository.getBestSeriesList(page: page, and: {
            serieListEntity in
            //Colocar em uma classe de mapeamento
            let serieList = serieListEntity.map { (serieListEntity) -> SerieList in
                let serieList = SerieList(results: [], page: serieListEntity.page, totalPages: serieListEntity.totalPages)
                return serieList
            }
            onCompletion(serieList)
        }, onError: onError)
    }
}
