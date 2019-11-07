//
//  SerieListViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct SerieListView: View {
    var presenter: SerieListPresentationLogic
    @ObservedObject var viewModel: SerieListViewModel
    
    init(presenter: SerieListPresentationLogic) {
        self.presenter = presenter
        self.viewModel = presenter.view as! SerieListViewModel
    }
    
    var body: some View {
        NavigationView {
            Group {
                if (self.viewModel.isLoading && self.viewModel.series.isEmpty) {
                    LoadingView()
                } else {
                    List {
                        ForEach(self.viewModel.series) { (serie: Serie) in
                            NavigationLink(destination: SerieDetailSceneFactory.createScene(serieId: serie.id)) {
                                SerieListItemView(serie: serie)
                            }.onAppear( perform: {
                                let index = self.viewModel.series.firstIndex(where: { $0.id == serie.id })!
                                let count = self.viewModel.series.count
                                
                                if index == count-1 {
                                    self.presenter.loadSeries()
                                }
                            })
                        }
                    }
                }
            }
        }
        .onAppear {
            if self.viewModel.series.isEmpty {
                self.presenter.loadSeries()
            }
        }
    }
}
