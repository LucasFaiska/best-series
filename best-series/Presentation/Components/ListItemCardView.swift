//
//  CardView.swift
//  best-series
//
//  Created by Lucas de Oliveira on 1/12/20.
//  Copyright © 2020 Lucas de Oliveira. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class ListItemCardView: UIView {
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.shadowRadius = newValue
            layer.masksToBounds = false
        }
    }
    
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
            layer.shadowColor = UIColor.darkGray.cgColor
        }
    }
    
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
            layer.shadowColor = UIColor.black.cgColor
            layer.masksToBounds = false
        }
    }
    
    var posterUrl: URL? = nil
    
    private func drawGradient() {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.6)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 0.5]
        gradient.opacity = 0.7
        gradient.cornerRadius = self.cornerRadius
        self.layer.insertSublayer(gradient, at: 10)
    }
    
    private func drawPoster() {
        let posterImageView = UIImageView(frame: .zero)
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.frame = self.bounds
        posterImageView.kf.setImage(with: posterUrl)
        self.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0),
            posterImageView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0),
        ])
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawPoster()
        drawGradient()
    }
}
