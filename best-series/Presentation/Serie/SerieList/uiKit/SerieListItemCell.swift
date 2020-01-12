//
//  SerieListItemViewController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/6/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit
import Kingfisher

class SerieListItemCell: UITableViewCell {
    static let reuseIdentifier = "SerieCell"
    
    var serie: Serie? {
        didSet {
            serieTitleLabel.text = serie?.title
            seriePosterImageView.kf.setImage(with: serie?.posterUrl)
        }
    }
    
    private let serieCellCardView: CardView = {
        let cardView = CardView()
        cardView.cornerRadius = 10
        cardView.shadowOpacity = 1
        cardView.shadowOffset = CGSize(width: 1, height: 1)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = UIColor.white
        return cardView
    }()
    
    private let serieTitleLabel = UILabel.with(textColor: .black, fontSize: 17)
        
    private let seriePosterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //@TODO fazer uma classe cardview que tenha uma UiImageView e uma UiLabel e o gradient por cima
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCellContent(serieCellCardView, seriePosterImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.serie = nil
    }
    
    private func addCellContent(_ cardView: CardView, _ posterImageView: UIImageView) {
        addSubview(cardView)
        cardView.addSubview(posterImageView)
        
        //posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            cardView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            posterImageView.heightAnchor.constraint(equalTo: cardView.heightAnchor, constant: 0),
            posterImageView.widthAnchor.constraint(equalTo: cardView.widthAnchor, constant: 0),
            posterImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            posterImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        ])
    }
}
