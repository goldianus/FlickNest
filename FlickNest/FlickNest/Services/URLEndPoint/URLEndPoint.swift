//
//  URLEndpoints.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 09/01/24.
//

import Foundation


let apiKey: String = " " //input your api key
let imagePath: String = "https://image.tmdb.org/t/p/original"

//MovieList
enum URLEndPoint {
  static let NowPlaying = "movie/now_playing?api_key="
  static let Popular = "movie/popular?api_key="
  static let Upcoming = "movie/upcoming?api_key="
  static let TopRated = "movie/top_rated?api_key="
  static let MovieDetails = "movie/"
  static let MovieSearch = "search/movie?api_key="
}
