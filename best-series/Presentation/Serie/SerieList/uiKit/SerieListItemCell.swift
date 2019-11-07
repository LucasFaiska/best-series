//
//  SerieListItemViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/6/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit

class SerieListItemCell: UITableViewCell {
    static let reuseIdentifier = "SerieCell"
    
    var serie: Serie? {
        didSet {
            serieTitleLabel.text = serie?.title
        }
    }
    
    private let serieTitleLabel = UILabel.with(textColor: .black, fontSize: 17)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        add(serieTitleLabel, offset: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.serie = nil
    }
    
    private func add(_ label: UILabel, offset: CGFloat) {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: offset),
            label.centerYAnchor.constraint(equalTo: centerYAnchor, constant: offset)
            ])
    }
}
