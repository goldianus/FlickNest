//
//  MovieCard.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 13/01/24.
//

import SwiftUI

struct MovieCard: View {
//  let movie = imageBanner
  var body: some View {
    ZStack {
      Image("img-Graphic-Art")
        .resizable()
        .scaledToFit()
        .cornerRadius(8)
        .shadow(radius: 4)
    }
    .frame(width: 160, height: 280)
  }
}

#Preview {
  MovieCard()
}
