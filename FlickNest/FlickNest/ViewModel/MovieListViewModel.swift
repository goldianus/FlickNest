//
//  MovieListViewModel.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 10/01/24.
//

import Foundation
import Combine


//MARK: - ViewModel for MovieList
class MovieListViewModel : ObservableObject {
  //MARK: - Properties
  
  @Published var arrMovieList: [ResultDataProvider] = []
  @Published var popularMovies: [ResultDataProvider] = []
  @Published var isLoading = false
  
  var totalPages = 0
  var pageCount = 1
  private var cancellables = Set<AnyCancellable>()
  private let movieListDataProvider : MovieListDataProvider
  
  init(dataProvider: MovieListDataProvider) {
    self.movieListDataProvider = dataProvider
  }
  
  // MARK: - Public Methods
  
  //MARK: - Load NowPlaying
  func getMovieList(_ showLoader: Bool) {
    if showLoader {
      self.isLoading = true
    }
    
    movieListDataProvider.getMovieList(pageCount)
    movieListDataProvider.arrMovieListData
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let err):
          print(err.localizedDescription)
          self.isLoading = false
        }
      }, receiveValue: { movieList in
        self.arrMovieList.append(contentsOf: movieList.results.sorted(by: {$0.voteAverage > $1.voteAverage}))
        self.totalPages = movieList.totalPages
        self.pageCount += 1
        self.isLoading = false
      })
      .store(in: &cancellables)
  }
  
  //MARK: - Load Popular
  func getPopularList() {
    movieListDataProvider.getPopularList(pageCount)
    movieListDataProvider.arrMovieListData
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let err):
          print(err.localizedDescription)
          self.isLoading = false
        }
      }, receiveValue: { popularList in
        self.popularMovies.append(contentsOf: popularList.results)
        self.totalPages = popularList.totalPages
        self.pageCount += 1
        self.isLoading = false
      })
      .store(in: &cancellables)
  }
  
  func getResetPageNTotalCount() {
    self.pageCount = 1
    self.totalPages = 0
    self.arrMovieList.removeAll()
  }
}
