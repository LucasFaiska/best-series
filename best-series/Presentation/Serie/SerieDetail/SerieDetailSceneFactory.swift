//
//  SerieDetailSceneFactory.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation
import SwiftUI

class SerieDetailSceneFactory: SerieDetailSceneCreationLogic {
    static func createScene(serieId: Int) -> SerieDetailView {
        let repository = RemoteSerieRepository()
        let interactor = SerieInteractor(serieRepository: repository)
        let presenter = SerieDetailPresenter(interactor: interactor)
        return SerieDetailView(serieId: serieId, presenter: presenter)
    }
}
