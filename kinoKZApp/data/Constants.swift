//
//  Constants.swift
//  kinoKZApp
//
//  Created by Bibisara Kenesova on 30.01.2023.
//

import Foundation
import SnapKit

struct Constants {
    
    struct Keys {
        static let api = "4e3dc7dc4a5b11fe1c4117abc03afbc0"
    }
    
    struct Identifiers {
        static let categoryCollectionViewCell = "CategoryCollectionViewCell"
        static let trendingCollectionViewCell = "TrendingCollectionView"
        static let categoryTableViewCell = "CategoryTableViewCell"
        static let placesTableViewCell = "PlacesTableViewCell"
        static let placesCollectionViewCell = "PlacesCollectionViewCell"
        static let movieCollectionViewCell = "MovieCollectionViewCell"
        static let popUpMainTableViewCell = "PopUpMainTableViewCell"
        
        //for place
        static let categoryCollectionViewCell2 = "CategoryCollectionViewCell2"
    }
    
    struct PlacesCategory {
        enum Headers: String, CaseIterable {
            case all = "🔥Все"
            case series = "🎞Кинотеатры"
            case streaming = "🍷Бары"
            case onTV = "🏀Спорт"
            case inTheaters = "🎭Театры"
        }
    }
    struct Colors {
        
    }
    
    struct Links {
        static let apiUrl = "https://api.themoviedb.org/3/"
        static let trendingURL = "\(apiUrl)trending/movie/day?api_key=\(Keys.api)"
        static let nowPlayingURL = "\(apiUrl)movie/now_playing?api_key=\(Keys.api)"
        static let imageUrl = "https://image.tmdb.org/t/p/w500/"
    }
    
    struct Categories {
        enum Category: String, CaseIterable {
            case all = "🔥Все"
            case series = "🎞Сериалы"
            case streaming = "🎮Стримы"
            case onTV = "🎬На экране"
            case inTheaters = "🎭Театры"
        }
    }
    
    struct DescriptionBank {
        static func allDataCell() -> [Info] {
            [
                .init(name: "Cinemax Dostyk Multiplex", adress: "Самал-2, д. 111, уг.ул. Жолдасбекова, ТРЦ «Достык Плаза»", imageName: "cinemax"),
                .init(name: "Lumiera Cinema (ЦУМ)", adress: "пр. Абылай хана, 62, «Арбат»", imageName: "lumiera"),
                .init(name: "Kinoforum 10 (ТРЦ Forum)", adress: "ул. Сейфуллина, 617, ТРЦ «Forum Almaty», 5-й этаж", imageName: "kinoforum10"),
                .init(name: "Kinopark 11 (Есентай) IMAX", adress: "пр. Аль-Фараби, 77/8, ТЦ «Esentai Mall»", imageName: "kinopark11"),
                .init(name: "Chaplin MEGA Alma-Ata", adress: "ул. Розыбакиева, 247А, ТРЦ «MEGA Alma-Ata»", imageName: "chaplin"),
                .init(name: "Chaplin MEGA Park", adress: "ул. Макатаева, 127, 3-й этаж", imageName: "chaplin2"),
                .init(name: "Kinopark 5 Premium Forum", adress: "ул. Сейфуллина, 617, ТРЦ «Forum Almaty», 3-й этаж", imageName: "kinoparkforum"),
                .init(name: "Chaplin ADK", adress: "ул. Сатпаева, 90 (уг. ул. Тлендиева), ТРК «АDК»", imageName: "chaplin3"),
                .init(name: "Kinopark 8 Moskva", adress: "пр. Абая, уг. пр. Алтынсарина, ТРЦ «MOSKVA Metropolitan»", imageName: "kinopark8"),
                .init(name: "Kinopark 5 Atakent", adress: "ул. Тимирязева, 42, ТРЦ «Atakent Mall»", imageName: "kinopark5"),
                .init(name: "Kinopark 6", adress: "м-н Мамыр-1, 8А, ТРК «Спутник», 3-й этаж", imageName: "kinopark6"),
                .init(name: "Kinoplexx 6 Almaty Mall", adress: "ул. Жандосова, 83, ТРЦ «Almaty Mall», 3-й этаж", imageName: "mall"),
                .init(name: "Kinoplexx 7 Aport", adress: "пр. Райымбека, западное напр., до указателя «Апорт», 2-й этаж", imageName: "aport"),
                .init(name: "Kinopark 4 Globus", adress: "пр. Абая, 109в, ТРЦ «Globus», 2-й этаж", imageName: "globus"),
                .init(name: "Kinoplexxx Sary Arka", adress: "ул. Алтынсарина, 24, уг. пр. Абая", imageName: "sa"),
                .init(name: "Арман 3D", adress: "пр. Достык, 104", imageName: "arman"),
                .init(name: "Иллюзион Maxima", adress: "пр. Райымбека, 239Г, ТРК «Maxima», 3-й этаж", imageName: "maxima"),
                .init(name: "Цезарь", adress: "пр. Назарбаева, 50, уг. ул. Гоголя", imageName: "caesar"),
                .init(name: "StandBy Club", adress: "ул. Зенкова, 24", imageName: "standup"),
                .init(name: "Almaty Arena", adress: "микрорайон Нұркент, 7", imageName: "arena")
            ]
        }
    }

    struct Info {
        let name: String
        let adress: String
        let imageName: String
    }
}
