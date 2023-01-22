//
//  photoBank.swift
//  tryGalleryWithoutTableView
//
//  Created by Bibisara Kenesova on 22.01.2023.
//

import Foundation

struct photoBank {
    static func allPhotos() -> [Photo] {
        [
            .init(id: 1, imageName: "africa"),
            .init(id: 2, imageName: "austrelia"),
            .init(id: 3, imageName: "argentina"),
            .init(id: 4, imageName: "bear"),
            .init(id: 5, imageName: "brazil"),
            .init(id: 6, imageName: "canberra"),
            .init(id: 7, imageName: "china"),
            .init(id: 8, imageName: "egypt"),
            .init(id: 9, imageName: "fran"),
            .init(id: 10, imageName: "germany"),
            .init(id: 11, imageName: "italy"),
            .init(id: 12, imageName: "japan"),
            .init(id: 13, imageName: "kanada"),
            .init(id: 14, imageName: "korea"),
            .init(id: 15, imageName: "marokko"),
            .init(id: 16, imageName: "tailand"),
            .init(id: 17, imageName: "usa"),
            .init(id: 18, imageName: "vietnam"),
            .init(id: 19, imageName: "чехия"),
            .init(id: 20, imageName: "юар")
        ]
    }
}

struct Photo {
    let id: Int
    let imageName: String
}
