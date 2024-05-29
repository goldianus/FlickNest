//
//  MovieListItem.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import SwiftUI

struct MovieListItem: View {
  var movie: MovieItem
  
  var body: some View {
    VStack {
      MoviePosterImage(path: movie.posterPath)
        .frame(width: 100, height: 100)
        .clipped()
      VStackLayout(alignment: .leading, spacing: 4) {
        Text(movie.title)
          .font(.headline)
          .lineLimit(1)
          .truncationMode(.tail)
        Text("Popularity: \(movie.popularity)")
          .font(.subheadline)
          .foregroundColor(.gray)
      }
      .padding([.leading, .trailing, .bottom], 8)
    }
    .padding()
    .background(Color.gray.opacity(0.2))
    .cornerRadius(8)
    .shadow(radius: 3)
  }
}

 #Preview {
  MovieListItem(movie: MovieItem(
    posterPath: "/path/to/poster1.jpg",
    adult: false,
    overview: "This is the overview of movie 1.",
    releaseDate: "2021-06-18",
    id: 1,
    originalTitle: "Original Title 1",
    originalLanguage: "en",
    title: "Movie Title 1",
    voteCount: 120,
    popularity: 8.5
))
 }
