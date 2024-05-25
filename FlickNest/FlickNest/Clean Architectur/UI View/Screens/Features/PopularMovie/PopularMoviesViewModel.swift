//
//  PopularMoviesViewModel.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import Foundation
import Combine

extension PopularMovies {
  class ViewModel: ObservableObject {
    @Published private(set) var state = State()
    
    struct State {
      var movies: [MovieItem] = []
      var page: Int = 1
      var isNextPageLoadable = true
    }
    
    private var service: MoviesService
    
    init() {
      self.service = MoviesService()
      loadNextPageIfNeeded()
    }
    
    func loadNextPageIfNeeded() {
      guard state.isNextPageLoadable else { return }
      print("Page: \(state.page)");
      
      Task {
        let result = await service.getPopularMovies(page: state.page)
        DispatchQueue.main.async {
          switch result {
          case .success(let res):
            self.state.page += 1
            self.state.movies += res.results
            self.state.isNextPageLoadable = self.state.page < res.totalPages
          case .failure(let error):
            self.state.isNextPageLoadable = false
            print(error.customMessage)
          }
        }
      }
    }
  }
}
