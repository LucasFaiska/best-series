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
            serieCellCardView.posterUrl = serie?.posterUrl
        }
    }
    
    private let serieCellCardView: ListItemCardView = {
        let cardView = ListItemCardView()
        cardView.cornerRadius = 10
        cardView.shadowOpacity = 1
        cardView.shadowOffset = CGSize(width: 1, height: 1)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = UIColor.white
        //@TODO this clipsToBounds remove the shadows from card, fix it soon
        cardView.clipsToBounds = true
        return cardView
    }()
    
    private let serieTitleLabel = UILabel.with(textColor: .black, fontSize: 17)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCellContent(serieCellCardView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.serie = nil
    }
    
    private func addCellContent(_ cardView: ListItemCardView) {
        addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            cardView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
