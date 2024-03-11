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
    .frame(width: 160, height: 280)
    .background(.white)
    .cornerRadius(10)
    .shadow(radius: 5)
    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
  }
  
  @ViewBuilder
  func PopularImageView() -> some View {
    let imgUrl = URL(string: "\(imagePath)" + "\(popularData.posterPath )")
    CustomSDWebImageView(imgURL: imgUrl,
                         imgWidth: 160,
                         imgHeight: 280,
                         placeholderImage: "StringConstants.placeholderImageFilm",
                         isCircle: false)
  }
}

#Preview {
  PopularCarouselView(popularData: ResultDataProvider(adult: true, backdropPath: "", genreIDS: [1], id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 2, posterPath: "StringConstants.placeholderImageFilm", releaseDate: "", title: "", video: true, voteAverage: 1, voteCount: 1))
}
