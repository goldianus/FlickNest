//
//  PopularCarouselView.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 11/03/24.
//

import SwiftUI

struct PopularCarouselView: View {
  var popularData: ResultDataProvider
  
  var body: some View {
    VStack(alignment: .center) {
      PopularImageView()
    }
    .frame(width: 200, height: 260)
    .background(.white)
    .cornerRadius(10)
    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
  }
  
  @ViewBuilder
  func PopularImageView() -> some View {
    let imgUrl = URL(string: "\(imagePath)" + "\(popularData.posterPath )")
    CustomSDWebImageView(imgURL: imgUrl,
                         imgWidth: 200,
                         imgHeight: 260,
                         placeholderImage: "StringConstants.placeholderImageFilm",
                         isCircle: false)
  }
}

#Preview {
  PopularCarouselView(popularData: ResultDataProvider(adult: true, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 2, posterPath: "StringConstants.placeholderImageFilm", releaseDate: "", title: "", video: true, voteAverage: 1, voteCount: 1))
}
