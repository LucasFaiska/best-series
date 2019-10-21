//
//  SerieDetailProtocols.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI

protocol SerieDetailSceneCreationLogic {
    static func createScene(serieId: Int) -> SerieDetailView
}
