//
//  MovieListModel.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 10/01/24.
//

import Foundation

// MARK: - MovieListModel
struct MovieListModel: Codable {
  var dates: Dates
  var page: Int
  var results: [Result]
  var totalPages, totalResults: Int
  
  enum CodingKeys: String, CodingKey {
    case dates, page, results
    case totalPages = "total_pages"
    case totalResults = "total_results"
  }
}

// MARK: - Dates
struct Dates: Codable {
  var maximum, minimum: String
}

// MARK: - Result
struct Result: Codable {
  var adult: Bool
  var backdropPath: String
  var genreIDS: [Int]
  var id: Int
  var originalLanguage, originalTitle, overview: String
  var popularity: Double
  var posterPath, releaseDate, title: String
  var video: Bool
  var voteAverage: Double
  var voteCount: Int
  
  enum CodingKeys: String, CodingKey {
    case adult
    case backdropPath = "backdrop_path"
    case genreIDS = "genre_ids"
    case id
    case originalLanguage = "original_language"
    case originalTitle = "original_title"
    case overview, popularity
    case posterPath = "poster_path"
    case releaseDate = "release_date"
    case title, video
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
  }
}
