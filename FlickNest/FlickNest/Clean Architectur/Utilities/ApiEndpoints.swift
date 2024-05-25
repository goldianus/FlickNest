//
//  ApiEndpoints.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import Foundation

enum ApiEndpoints {
  case moviePopular(page: Int)
}

extension ApiEndpoints: Endpoint {
  var path: String {
    switch self {
    case .moviePopular(let page):
      return "movie/popular?page=\(page)"
    }
  }
  
  var method: RequestMethod {
    switch self {
    case .moviePopular:
      return .get
    }
  }
  
  var header: [String: String]? {
    switch self {
    case .moviePopular:
      return [
        "Authorization": "Bearer \(Api_Key)",
        "Content-Type": "application/json;charset=utf-8"
      ]
    }
  }
  
  var body: [String: String]? {
    switch self {
    case .moviePopular:
      return nil
    }
  }
}
