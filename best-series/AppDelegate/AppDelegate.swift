//
//  AppDelegate.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/19/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let seriesListViewController = SerieListSceneFactory.createScene()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = DarkNavigationController(rootViewController: seriesListViewController)
        window?.makeKeyAndVisible()
        
        return true
    }
}

