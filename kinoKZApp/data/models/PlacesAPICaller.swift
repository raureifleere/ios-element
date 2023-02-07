//
//  PlacesAPICaller.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 07.02.2023.
//

import Foundation

protocol PlacesAPICallerDelegate {
    func didUpdateMovieList(with nowPlayingList: [NowPlayingModel])
    func didFailWithError(_ error: Error)
}

struct PlacesAPICaller {
    
    var delegate: PlacesAPICallerDelegate?
    
    func fetchRequest() {
        let urlString = Constants.Links.nowPlayingURL
        guard let url = URL(string: urlString) else { fatalError("Incorrect link") }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            if let data = data, error == nil {
                if let nowPlayingList = parseJSON(data) {
                    delegate?.didUpdateMovieList(with: nowPlayingList)
                } else {
                    delegate?.didFailWithError(error!)
                }
            } else {
                delegate?.didFailWithError(error!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> [NowPlayingModel]? {
        var nowPlayingList: [NowPlayingModel] = []
        do {
            let decodedData = try JSONDecoder().decode(NowPlayingData.self, from: data)
            for movie in decodedData.results {
                let nowPlayingModel = NowPlayingModel(adult: movie.adult, backdropPath: movie.backdrop_path, genreIds: movie.genre_ids, id: movie.id, overview: movie.overview, posterPath: movie.poster_path, title: movie.title, releaseDate: movie.release_date, voteAverage: movie.vote_average)
                nowPlayingList.append(nowPlayingModel)
            }
        } catch {
            print(error)
            return nil
        }
        return nowPlayingList
    }
}
