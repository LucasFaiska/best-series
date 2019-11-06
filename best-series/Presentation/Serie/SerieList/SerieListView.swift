//
//  SerieListViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI

struct SerieListView<T>: View where T:SerieListPresentationLogic {
    @ObservedObject var presenter: T
    
    init(presenter: T) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            Group {
                if (self.presenter.isLoading && self.presenter.series.isEmpty) {
                    LoadingView()
                } else {
                    List {
                        ForEach(self.presenter.series) { (serie: Serie) in
                            NavigationLink(destination: SerieDetailSceneFactory.createScene(serieId: serie.id)) {
                                SerieListItemView(serie: serie)
                            }.onAppear( perform: {
                                let index = self.presenter.series.firstIndex(where: { $0.id == serie.id })!
                                let count = self.presenter.series.count
                                
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
            if self.presenter.series.isEmpty {
                self.presenter.loadSeries()
            }
        }
    }
}
