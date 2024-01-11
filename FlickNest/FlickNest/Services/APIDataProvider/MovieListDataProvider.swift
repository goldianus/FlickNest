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
  var arrMovieListData = PassthroughSubject<MovieListModel, Never>()
  
  func getMovieList(_ pageCount: Int) {
    let url = NetworkURL.getMovieList(apiKey: apiKey, pageCount: pageCount).url
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
        
        self.arrMovieListData.send(movieList)
      }).store(in: &self.subscriptions)
  }
}

