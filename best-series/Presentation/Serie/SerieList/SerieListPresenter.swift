//
//  SerieListPresenter.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation
import SwiftUI

class SerieListPresenter: ObservableObject {
    private var interactor: SerieInteractorProtocol?
    var currentPage = 1
    
    @Published var series: [Serie] = []
    @Published var isLoading = false
    @Published var hasError = false
    
    init (interactor: SerieInteractorProtocol) {
        self.interactor = interactor
    }
    
    func onBestSeriesLoadedSuccessful(_ serieList:SerieList?) -> Void {
        self.series.append(contentsOf: serieList?.results ?? [])
        self.isLoading = false
    }
    
    func onBestSeriesLoadedError() -> Void {
        self.hasError = true
        self.isLoading = false
    }
    
    func loadSeries() {
        self.isLoading = true
        interactor?.fetchBestSeries(page: currentPage, and: onBestSeriesLoadedSuccessful, onError: onBestSeriesLoadedError)
    }
}
