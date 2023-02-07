//
//  MovieModel.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 07.02.2023.
//

import Foundation

struct MovieModel {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let genreIds: [Int]
    let releaseDate: String
    let voteAverage: Double
}
