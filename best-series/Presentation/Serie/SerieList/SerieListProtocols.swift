//
//  SerieListProtocol.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit

protocol SerieListSceneCreationLogic {
    static func createScene() -> UIViewController
}

protocol SerieListPresentationLogic  {
    var view: SerieListViewLogic { get set }
    func onBestSeriesLoadedSuccessful(_ serieList:SerieList?) -> Void
    func onBestSeriesLoadedError() -> Void
    func loadSeries()
}

protocol SerieListViewLogic {
    func showLoading()
    func hideLoading()
    func present(series: [Serie])
    //func presentError(message: String)
}
