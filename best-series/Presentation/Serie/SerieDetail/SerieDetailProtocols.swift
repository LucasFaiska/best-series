//
//  SerieDetailProtocols.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
protocol SerieDetailSceneCreationLogic {
    static func createScene(serieId: Int) -> SerieDetailView<SerieDetailPresenter>
}

@available(iOS 13.0, *)
protocol SerieDetailPresentationLogic: ObservableObject  {
    var isLoading:Bool { get set }
    var serie:Serie? { get set }
 
    func onSeriesDetailLoadedSuccessful(_ serie: Serie?) -> Void
    func onSeriesDetailLoadedError() -> Void
    func loadSerieDetail(serieId: Int)
}
