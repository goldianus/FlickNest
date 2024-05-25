//
//  MovieImage.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import SwiftUI

struct MoviePosterImage: View {
  var path: String = ""
  var width: CGFloat = 50
  
  var body: some View {
    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(path)")) { image in
      image.resizable().scaledToFit()
    } placeholder: {
      Image(systemName: "photo.artframe")
    }
    .frame(width: width, alignment: .center)
    .cornerRadius(10)
  }
}

#Preview {
  MoviePosterImage(path: "")
}
