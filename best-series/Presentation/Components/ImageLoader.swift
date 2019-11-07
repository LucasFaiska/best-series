//
//  ImageLoader.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
class ImageLoader: ObservableObject {
    static let imageCache = NSCache<AnyObject, AnyObject>()
    
    @Published var image: UIImage? = nil
    
    public func downloadImage(url: URL) {
        let urlString = url.absoluteString

        if let imageFromCache = ImageLoader.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }

        URLSession.shared.dataTask(with: url) { (data, res, error) in
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                ImageLoader.imageCache.setObject(image, forKey: urlString  as AnyObject)
                self?.image = image
            }
        }.resume()
    }
}
