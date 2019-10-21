//
//  SerieRepositoryProtocols.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

protocol SerieRepository {
    func getBestSeriesList(page: Int, and onCompletion: @escaping (SerieListEntity?) -> Void, onError: @escaping () -> Void)
    func getSerieDetail(serieId: Int, and onCompletion: @escaping (SerieEntity?) -> Void, onError: @escaping () -> Void)
}
