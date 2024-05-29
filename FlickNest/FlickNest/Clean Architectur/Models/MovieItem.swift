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


let dummyMovies: [MovieItem] = [
    MovieItem(
        posterPath: "/path/to/poster1.jpg",
        adult: false,
        overview: "This is the overview of movie 1.",
        releaseDate: "2021-06-18",
        id: 1,
        originalTitle: "Original Title 1",
        originalLanguage: "en",
        title: "Movie Title 1",
        voteCount: 120,
        popularity: 8.5
    ),
    MovieItem(
        posterPath: "/path/to/poster2.jpg",
        adult: false,
        overview: "This is the overview of movie 2.",
        releaseDate: "2021-07-22",
        id: 2,
        originalTitle: "Original Title 2",
        originalLanguage: "en",
        title: "Movie Title 2",
        voteCount: 450,
        popularity: 7.3
    ),
    MovieItem(
        posterPath: "/path/to/poster3.jpg",
        adult: true,
        overview: "This is the overview of movie 3.",
        releaseDate: "2022-03-15",
        id: 3,
        originalTitle: "Original Title 3",
        originalLanguage: "es",
        title: "Movie Title 3",
        voteCount: 300,
        popularity: 9.1
    ),
    MovieItem(
        posterPath: "/path/to/poster4.jpg",
        adult: false,
        overview: "This is the overview of movie 4.",
        releaseDate: "2020-11-05",
        id: 4,
        originalTitle: "Original Title 4",
        originalLanguage: "fr",
        title: "Movie Title 4",
        voteCount: 215,
        popularity: 6.8
    ),
    MovieItem(
        posterPath: "/path/to/poster5.jpg",
        adult: false,
        overview: "This is the overview of movie 5.",
        releaseDate: "2019-09-10",
        id: 5,
        originalTitle: "Original Title 5",
        originalLanguage: "ja",
        title: "Movie Title 5",
        voteCount: 520,
        popularity: 8.9
    )
]

