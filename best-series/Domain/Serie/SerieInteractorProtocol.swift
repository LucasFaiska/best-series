//
//  SerieInteractorProtocols.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

protocol SerieInteractorProtocol {
    func fetchBestSeries(page: Int, and onCompletion: @escaping (SerieList?) -> Void, onError: @escaping () -> Void)
    func fetchSerieDetail(serieId: Int, and onCompletion: @escaping (Serie?) -> Void, onError: @escaping () -> Void)
}
