//
//  SerieDetailView.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI

struct SerieDetailView: View {
    @ObservedObject var presenter: SerieDetailPresenter
    @ObservedObject var imageLoader = ImageLoader()
    
    var serieId: Int
    
    init(serieId: Int, presenter: SerieDetailPresenter) {
        self.serieId = serieId
        self.presenter = presenter
    }
    
    var body: some View {
        ScrollView {
            Group {
                if (self.presenter.serie != nil) {
                    PosterView(image: self.imageLoader.image)
                        .onAppear {
                            if let url = self.presenter.serie?.posterUrl {
                                self.imageLoader.downloadImage(url: url)
                            }
                    }
                    
                    
                    SerieDetailsSectionView(serie: self.presenter.serie!).padding(16)
                    
                } else {
                    LoadingView()
                }
            }
            .onAppear {
                self.presenter.loadSerieDetail(serieId: self.serieId)
            }
        }
    }
    
    struct PosterView: View {
        var image: UIImage?
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .aspectRatio(500/750, contentMode: .fit)
                
                if (self.image != nil) {
                    Image(uiImage: self.image!)
                        .resizable()
                        .aspectRatio(500/750, contentMode: .fit)
                }
            }
        }
    }
    
    struct SerieDetailsSectionView: View {
        var serie: Serie
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(serie.title).font(.title)
                
                Text("Overview").font(.headline).padding(.top, 8)
                Text(serie.overview)
                    .font(.body)
                    .lineLimit(5)
                
                Text("First year in air").font(.headline).padding(.top, 8)
                Text(serie.firstAirYear).font(.body)
                
                Text("Vote average").font(.headline).padding(.top, 8)
                Text(String(serie.voteAverage)).font(.body)
                
                Text("Genres").font(.headline).padding(.top, 8)
                ForEach(serie.genres) { (genre: Genre) in
                    Text(genre.name).font(.body)
                }
            }
        }
    }
}
