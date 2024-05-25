//
//  MovieItem.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import Foundation

struct MovieItem: Identifiable, Codable {
  let posterPath: String
  let adult: Bool
  let overview: String
  let releaseDate: String
  let id: Int
  let originalTitle: String
  let originalLanguage: String
  let title: String
  let voteCount: Int
  let popularity: Float
}
