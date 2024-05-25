//
//  MovieService.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 25/05/24.
//

import Foundation


protocol MoviesServiceProtocol {
  func getPopularMovies(page: Int) async -> Result<PopularMovieList, RequestError>
}

struct MoviesService: ApiRepository, MoviesServiceProtocol {
  func getPopularMovies(page: Int = 1) async -> Result<PopularMovieList, RequestError> {
    return await sendRequest(endpoint: ApiEndpoints.moviePopular(page: page), responseModel: PopularMovieList.self)
  }
}
