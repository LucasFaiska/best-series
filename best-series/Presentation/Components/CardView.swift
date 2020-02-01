//
//  CardView.swift
//  best-series
//
//  Created by Lucas de Oliveira on 1/12/20.
//  Copyright © 2020 Lucas de Oliveira. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView {
    
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
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0, y: 0.6)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.frame = self.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 0.5]
        gradient.opacity = 0.9
        gradient.cornerRadius = self.cornerRadius
        self.layer.insertSublayer(gradient, at: 10)
    }
}
