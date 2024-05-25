//
//  MoviePopular.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import Foundation

struct PopularMovieList: Codable {
  let page: Int
  let totalResults: Int
  let totalPages: Int
  let results: [MovieItem]
}
