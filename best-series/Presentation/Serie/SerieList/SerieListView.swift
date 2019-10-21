//
//  SerieListViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI

struct SerieListView: View {
    @ObservedObject var presenter: SerieListPresenter
    
    init(presenter: SerieListPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            Group {
                if presenter.isLoading {
                    LoadingView()
                } else {
                    List(self.presenter.series) { (serie: Serie) in
                        NavigationLink(destination: SerieDetailSceneFactory.createScene(serieId: serie.id)) {
                            SerieListItemView(serie: serie)
                        }
                    }
                }
            }
            .navigationBarTitle("Bests TV Series")
        }
        .onAppear {
            if self.presenter.series.isEmpty {
                self.presenter.loadSeries()
            }
        }
    }
}
