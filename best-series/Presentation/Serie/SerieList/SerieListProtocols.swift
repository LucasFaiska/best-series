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

protocol SerieListPresentationLogic {
    func requestSeries()
}

protocol SerieListViewLogic {
    func showLoading()
    //func hideLoading()
    //func present(songs: [ViewSong])
    //func presentError(message: String)
}

