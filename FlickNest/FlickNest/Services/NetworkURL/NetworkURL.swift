//
//  NetworkURL.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 09/01/24.
//

import Foundation


enum NetworkURL {
  case getNowPlayingList(apiKey: String, pageCount: Int)
  case getMovieDetails(movieId: String, apiKey: String)
  case getMovieSearch(apiKey: String,  query: String)
}

extension NetworkURL {
  var url: URL? {
    switch self {
    case .getNowPlayingList(let apiKey, let pageCount):
      let endPointPath = "\(URLEndPoint.NowPlaying)\(apiKey)&page=\(pageCount)"
      return URL(string: NetworkURL.baseURLString + endPointPath)
    case .getMovieDetails(let movieId, let apiKey):
      let endPointPath = "\(URLEndPoint.MovieDetails)\(movieId)?api_key=\(apiKey)"
      return URL(string: NetworkURL.baseURLString + endPointPath)
    case .getMovieSearch(let apiKey, let query):
      let endPointPath = "\(URLEndPoint.MovieSearch)\(apiKey)&query=\(query)"
      return URL(string: NetworkURL.baseURLString + endPointPath)
    }
  }
  
  static var baseURL: URL? {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.themoviedb.org"
    components.path = "/3/"
    guard let url = components.url else { return nil }
    return url
  }
  
  static var baseURLString: String {
    return NetworkURL.baseURL?.absoluteString ?? ""
  }
}
