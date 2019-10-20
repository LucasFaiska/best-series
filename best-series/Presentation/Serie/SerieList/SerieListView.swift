//
//  SerieListViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI
import ObjectMapper

struct SerieListView: SerieListViewLogic, View {
    var presenter: SerieListPresenter?
    let series = [Serie(id:0, title: "Arrow"), Serie(id: 1, title: "Flash"), Serie(id:2, title: "Breaking Bad"), Serie(id:3, title: "Lucifer")]
    
    func showLoading() {
    }
    
    var body: some View {
        NavigationView {
            List(self.series) { (serie: Serie) in
                SerieListItemView(serie: serie)
            }
        }
    }
}
