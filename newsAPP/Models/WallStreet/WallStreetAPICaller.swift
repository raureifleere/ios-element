//
//  wallStreetAPICaller.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 25.02.2023.
//

import Foundation
import Kingfisher
import Alamofire

protocol WallstreetAPICallerDelegate {
    func didUpdateMovieList(with newsList: [WallStreetModel])
    func didFailWithError(_ error: Error)
}

struct WallStreetAPICaller {
    
    static var shared = WallStreetAPICaller()
    var delegate: WallstreetAPICallerDelegate?
    
    func fetchRequest(with query: String = "") {
        let urlString = "\(Constans.Links.baseURL)everything?domains=wsj.com&apiKey=\(Constans.Keys.api)&q=\(query)"
        guard let url = URL(string: urlString) else { fatalError("Incorrect link") }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                if let newsList = parseJSON(data) {
                    delegate?.didUpdateMovieList(with: newsList)
                    print(newsList[0].title)
                } else {
                    delegate?.didFailWithError(error!)
                }
            } else {
                delegate?.didFailWithError(error!)
            }
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> [WallStreetModel]? {
        var newsList: [WallStreetModel] = []
        do {
            let decodedData = try JSONDecoder().decode(WallStreetData.self, from: data)
            for newsData in decodedData.articles {
                let newsModel = WallStreetModel(title: newsData.title, publishedAt: newsData.publishedAt, urlToImage: newsData.urlToImage, content: newsData.content)
                newsList.append(newsModel)
            }
        } catch {
            print(error)
        }
        return newsList
    }
}
