//
//  Extensions.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/6/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit

extension UILabel {
    static func with(textColor: UIColor, fontSize: CGFloat) -> UILabel {
        let label = UILabel(frame: .zero)
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
