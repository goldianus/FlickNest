//
//  PopularMovies.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import SwiftUI

struct PopularMovies: View {
  @ObservedObject var viewModel: ViewModel
  
  let columns = [
    GridItem(.fixed(120), spacing: 16),
    GridItem(.fixed(120), spacing: 16),
    GridItem(.fixed(120), spacing: 16)
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(viewModel.state.movies) { movie in
            MovieListItem(movie: movie)
          }
          
          if viewModel.state.isNextPageLoadable {
            Button(action: {
              viewModel.loadNextPageIfNeeded()
            }) {
              Text("More")
                .padding()
                .frame(width: 100, height: 40)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .accessibility(identifier: "loadMore")
          }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
      }
      .navigationTitle("Popular Movies")
    }
  }
}

#Preview {
  PopularMovies(viewModel: PopularMovies.ViewModel.init())
}
