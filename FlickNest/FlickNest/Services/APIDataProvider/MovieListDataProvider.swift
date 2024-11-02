//
//  MovieListDataProvider.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 10/01/24.
//

import Foundation
import Combine

// MARK: - MovieListDataProvider

class MovieListDataProvider {
  private var subscriptions = Set<AnyCancellable>()
  private let networkManager = NetworkManager()
  var nowPlayingMoviesData = PassthroughSubject<MovieListModel, Never>()
  
  func getNowPlayingMovies(_ pageCount: Int) {
    let url = NetworkURL.getNowPlayingMoviesList(apiKey: apiKey, pageCount: pageCount).url
    let model = NetworkModel(url: url, method: .get)
    networkManager.callAPI(with: model)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error)
        }
      }, receiveValue: { movieList in
        
        self.nowPlayingMoviesData.send(movieList)
      }).store(in: &self.subscriptions)
  }
  
  func getPopularList(_ pageCount: Int) {
    let url = NetworkURL.getPopularList(apiKey: apiKey, pageCount: pageCount).url
    
    let model = NetworkModel(url: url, method: .get)
    networkManager.callAPI(with: model)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error)
        }
      }, receiveValue: { movieList in
        self.nowPlayingMoviesData.send(movieList)
      }).store(in: &self.subscriptions)
  }
}
