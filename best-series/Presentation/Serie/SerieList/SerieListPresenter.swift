//
//  SerieListPresenter.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation

class SerieListPresenter: SerieListPresentationLogic, ObservableObject {
    private var view: SerieListViewLogic?
    private var interactor: SerieInteractorProtocol?
    
    init(view: SerieListViewLogic) {
        self.view = view
    }
    
    func requestSeries() {
        view?.showLoading()
    }
}
