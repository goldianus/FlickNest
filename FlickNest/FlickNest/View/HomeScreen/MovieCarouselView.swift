//
//  MovieCarouselView.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 13/01/24.
//

import SwiftUI

struct MovieCarouselView: View {
  let title: String
  let btnSeeAll: String
  let imageModel = imageBanner
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Text(title)
          .font(.title)
          .fontWeight(.bold)
          .foregroundColor(.white)
        
        Spacer()
        
        Text(btnSeeAll)
          .font(.headline)
          .fontWeight(.bold)
          .foregroundColor(.primaryBlue)
      }
      .padding(.horizontal)
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 16) {
          ForEach(self.imageModel, id:\.self) { movie in
            MovieCard()
          }
        }
        .padding(.leading, 16)
      }
      .padding(.top, -40)
    }
  }
}

#Preview {
  MovieCarouselView(title: "Now Playing", btnSeeAll: "See All")
}
