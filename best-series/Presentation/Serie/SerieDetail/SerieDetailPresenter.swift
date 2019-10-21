//
//  SerieDetailPresenter.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

class SerieDetailPresenter: ObservableObject {
    private var interactor: SerieInteractorProtocol?
    
    @Published var serie: Serie?
    @Published var isLoading = false
    @Published var hasError = false
    
    init (interactor: SerieInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadSerieDetail(serieId: Int) {
        self.isLoading = true
        
        interactor?.fetchSerieDetail(serieId: serieId, and: { serie in
            self.serie = serie ?? Serie()
            self.isLoading = false
        }, onError: {
            self.hasError = true
            self.isLoading = false
        })
    }
}

