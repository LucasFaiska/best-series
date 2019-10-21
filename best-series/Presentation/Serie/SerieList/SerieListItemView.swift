//
//  SerieListItem.swift
//  best-series
//
//  Created by Lucas de Oliveira on 10/20/19.
//  Copyright © 2019 Lucas de Oliveira. All rights reserved.
//
import SwiftUI

struct SerieListItemView: View {
    var serie: Serie
    @ObservedObject var imageLoader: ImageLoader = ImageLoader()
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            if (imageLoader.image != nil) {
                GeometryReader { geometry in
                    Image(uiImage: self.imageLoader.image!)
                        .resizable(resizingMode: Image.ResizingMode.stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: geometry.size.width)
                        .clipped()
                }
            }
            VStack(alignment: .leading) {
                Text(serie.title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                Text(serie.firstAirYear)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .lineLimit(2)
                Text(String(format:"%.1f", serie.voteAverage))
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
            }
            .frame(maxWidth: .infinity, alignment: .bottomLeading)
            .padding(EdgeInsets.init(top: 16, leading: 16, bottom: 16, trailing: 16))
            .background(Rectangle().foregroundColor(Color.black).opacity(0.6).blur(radius: 2.5))
        }
        .background(Color.secondary)
        .cornerRadius(10)
        .shadow(radius: 20)
        .padding(EdgeInsets.init(top: 8, leading: 0, bottom: 8, trailing: 0))
        .frame(height: 500)
        .onAppear {
            if let url = self.serie.posterUrl {
                self.imageLoader.downloadImage(url: url)
            }
        }
    }
}
