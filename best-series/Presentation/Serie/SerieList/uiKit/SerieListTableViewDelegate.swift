//
//  SerieListTableViewDataSource.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/7/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class SerieListTableViewDelegate: UITableViewDataSource, UITableViewDelegate {
    private var series: [Serie] = []
    
    init(series: [Serie]) {
        self.series = series
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.series.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SerieListItemCell.reuseIdentifier, for: indexPath) as? SerieListItemCell else {
            return UITableViewCell()
        }
        
        cell.serie = series[indexPath.row]
        
        return cell
    }
}
