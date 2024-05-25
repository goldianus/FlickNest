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
    HStack {
      MoviePosterImage(path: movie.posterPath)
      
      VStack(alignment: .leading) {
        Text(movie.title)
        Text("Popularity: \(movie.popularity)")
          .font(.subheadline)
          .foregroundColor(.gray)
      }
    }
  }
}

//#Preview {
//  MovieListItem(movie: <#MovieItem#>)
//}
