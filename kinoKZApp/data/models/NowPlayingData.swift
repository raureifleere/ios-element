//
//  NowPlayingData.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 07.02.2023.
//

import Foundation

struct NowPlayingData: Decodable {
    let results: [NowPlayingResults]
}

struct NowPlayingResults: Decodable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let overview: String
    let poster_path: String
    let title: String
    let release_date: String
    let vote_average: Double
}
