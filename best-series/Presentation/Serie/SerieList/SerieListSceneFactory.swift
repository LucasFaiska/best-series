//
//  SerieListSceneFactory.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit
import SwiftUI

class SerieListSceneFactory: SerieListSceneCreationLogic {
    static func createScene() -> UIViewController {
        let repository = RemoteSerieRepository()
        let interactor = SerieInteractor(serieRepository: repository)
        let presenter = SerieListPresenter(interactor: interactor)
        let view = SerieListView<SerieListPresenter>(presenter: presenter)
        return UIHostingController(rootView: view)
    }
}
