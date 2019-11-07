//
//  DarkNavigationController.swift
//  best-series
//
//  Created by Lucas de Oliveira on 11/7/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit

class DarkNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    private func configNavigationBar() {
        self.navigationBar.barTintColor = .primary
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 17)]
        self.navigationBar.isTranslucent = false
    }
    
}
