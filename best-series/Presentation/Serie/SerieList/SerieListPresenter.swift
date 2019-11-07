//
//  SerieListPresenter.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/7/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

class SerieListPresenter: SerieListPresentationLogic {
    private var interactor: SerieInteractorProtocol
    var view: SerieListViewLogic
    var currentPage = 1
    
    init (view: SerieListViewLogic, interactor: SerieInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func onBestSeriesLoadedSuccessful(_ serieList:SerieList?) -> Void {
        view.present(series: serieList?.results ?? [])
        view.hideLoading()
        
        if (self.currentPage < (serieList?.totalPages)!) {
            self.currentPage += 1
        }
    }
    
    func onBestSeriesLoadedError() -> Void {
        //self.view.hasError = true
        view.hideLoading()
    }
    
    func loadSeries() {
        view.showLoading()
        interactor.fetchBestSeries(page: currentPage, and: onBestSeriesLoadedSuccessful, onError: onBestSeriesLoadedError)
    }
}
