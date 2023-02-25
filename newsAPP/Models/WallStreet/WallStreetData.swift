//
//  wallStreetData.swift
//  newsAPP
//
//  Created by Bibisara Kenesova on 25.02.2023.
//

import Foundation

struct WallStreetData: Decodable {
    let articles: [Article]
    
    struct Article: Decodable {
        let title: String
        let publishedAt: String
        let urlToImage: String
        let content: String
    }
}
