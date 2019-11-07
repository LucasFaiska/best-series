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
        
        if #available(iOS 13, *) {
            let viewModel = SerieListViewModel()
            let presenter = SerieListPresenter(view: viewModel, interactor: interactor)
            let view = SerieListView(presenter: presenter)
            return UIHostingController(rootView: view)
        }
        
        let view = SerieListViewController()
        let presenter = SerieListPresenter(view: view, interactor: interactor)
        view.presenter = presenter
        return view
    }
}
