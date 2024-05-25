//
//  PopularMovies.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import SwiftUI

struct PopularMovies: View {
  @ObservedObject var viewModel: ViewModel
  
  var body: some View {
    NavigationView {
      List() {
        ForEach(viewModel.state.movies) { movie in
          MovieListItem(movie: movie)
        }
        
        if viewModel.state.isNextPageLoadable {
          Button(action: {
            viewModel.loadNextPageIfNeeded()
          }) {
            Text("Load More")
              .padding()
              .frame(width: 200, height: 40)
              .background(Color.blue)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
            .accessibility(identifier: "loadMore")
        }
      }
      .navigationTitle("Popular Movies")
    }
  }
}

#Preview {
  PopularMovies(viewModel: PopularMovies.ViewModel.init())
}
