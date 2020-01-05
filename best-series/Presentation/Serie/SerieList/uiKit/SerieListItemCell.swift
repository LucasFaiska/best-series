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
    
    private let serieTitleLabel = UILabel.with(textColor: .black, fontSize: 17)
    
    private let seriePosterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //@TODO fazer uma classe cardview que tenha uma UiImageView e uma UiLabel e o gradient por cima
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCellContent(seriePosterImageView)
        //addSeriePosterImageView(seriePosterImageView, seriePosterContainerView)
        //addSeriePosterImageView(seriePosterImageView)
        //add(serieTitleLabel, offset: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.serie = nil
    }
    
    private func addCellContent(_ posterImageView: UIImageView) {
        addSubview(posterImageView)
        
        NSLayoutConstraint.activate([
            posterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            posterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 500),
            posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
