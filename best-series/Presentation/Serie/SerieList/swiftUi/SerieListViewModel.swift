//
//  SerieListPresenter.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
class SerieListViewModel: SerieListViewLogic, ObservableObject {
    
    @Published var series: [Serie] = []
    @Published var isLoading = false
    @Published var hasError = false
    
    func showLoading() {
        self.isLoading = true
    }
    
    func hideLoading() {
        self.isLoading = false
    }
    
    func present(series: [Serie]) {
        self.series.append(contentsOf: series)
    }
}
