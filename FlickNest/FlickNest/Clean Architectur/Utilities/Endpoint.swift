//
//  Endpoint.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import Foundation

protocol Endpoint {
  var baseURL: String { get }
  var path: String { get }
  var method: RequestMethod { get }
  var header: [String: String]? { get }
  var body: [String: String]? { get }
}

extension Endpoint {
  var baseURL: String {
    return "https://api.themoviedb.org/3/"
  }
}
