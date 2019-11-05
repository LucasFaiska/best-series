//
//  SerieDetailPresenter.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

class SerieDetailPresenter: SerieDetailPresentationLogic, ObservableObject {
    @Published var isLoading: Bool
    @Published var serie: Serie?
    //@Published var hasError = false
    
    private var interactor: SerieInteractorProtocol?
    
    init (interactor: SerieInteractorProtocol) {
        self.interactor = interactor
        self.isLoading = true
    }
    
    func onSeriesDetailLoadedSuccessful(_ serie: Serie?) -> Void {
        self.serie = serie ?? Serie()
        self.isLoading = false
    }
    
    func onSeriesDetailLoadedError() -> Void {
        //self.hasError = true
        isLoading = false
    }
    
    func loadSerieDetail(serieId: Int) {
        isLoading = true
        interactor?.fetchSerieDetail(serieId: serieId, and: onSeriesDetailLoadedSuccessful, onError: onSeriesDetailLoadedError)
    }
}

