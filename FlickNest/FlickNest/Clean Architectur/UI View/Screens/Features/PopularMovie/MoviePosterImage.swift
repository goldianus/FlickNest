//
//  MovieImage.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import SwiftUI

struct MoviePosterImage: View {
  var path: String = ""
  
  var body: some View {
    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(path)")) { image in
      image.resizable().scaledToFit()
    } placeholder: {
      Image(systemName: "film")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .clipped()
    }
  }
}

#Preview {
  MoviePosterImage(path: "")
}
