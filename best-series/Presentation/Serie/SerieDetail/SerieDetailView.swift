//
//  SerieDetailView.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct SerieDetailView<T>: View where T:SerieDetailPresentationLogic {
    @ObservedObject var presenter: T
    @ObservedObject var imageLoader = ImageLoader()
    
    var serieId: Int
    
    init(serieId: Int, presenter: T) {
        self.serieId = serieId
        self.presenter = presenter
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if (self.presenter.isLoading) {
                    LoadingView()
                } else {
                    PosterView(image: self.imageLoader.image)
                        .onAppear {
                            if let url = self.presenter.serie?.posterUrl {
                                self.imageLoader.downloadImage(url: url)
                            }
                    }
                    SerieDetailsSectionView(serie: self.presenter.serie!).padding(16)
                    SimilarSeriesSectionView(series: self.presenter.serie?.similarSeries.results ?? []).padding(16)
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
                    .aspectRatio(500/750, contentMode: .fill)
                
                if (self.image != nil) {
                    Image(uiImage: self.image!)
                        .resizable()
                        .aspectRatio(500/750, contentMode: .fill)
                }
            }
        }
    }
    
    struct SerieDetailsSectionView: View {
        var serie: Serie
        
        var body: some View {
            VStack(alignment: .leading) {
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
    
    struct SimilarSeriesSectionView: View {
        var series: [Serie]
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Similar Series").font(.headline).padding(.top, 8)
                ScrollView(.horizontal, content: {
                    HStack(spacing: 20) {
                        ForEach(series) { serie in
                            NavigationLink(destination: SerieDetailSceneFactory.createScene(serieId: serie.id)) {
                                SimilarSeriesThumbnail(serie: serie)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                })
            }
        }
    }
    
    struct SimilarSeriesThumbnail: View {
        var serie: Serie
        @ObservedObject var imageLoader = ImageLoader()
        
        var body: some View {
            ZStack(alignment: .bottomLeading) {
                if (self.imageLoader.image != nil) {
                    GeometryReader { geometry in
                        Image(uiImage: self.imageLoader.image!)
                            .resizable(resizingMode: Image.ResizingMode.stretch)
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: geometry.size.width)
                            .clipped()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(self.serie.title)
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                .background(Rectangle().foregroundColor(Color.black).opacity(0.6).blur(radius: 2.5))
            }
            .cornerRadius(10)
            .frame(height: 200)
            .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0))
            .onAppear {
                if let url = self.serie.posterUrl {
                    self.imageLoader.downloadImage(url: url)
                }
            }
        }
    }
}
