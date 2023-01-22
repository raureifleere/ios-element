//
//  changeColor.swift
//  tryGalleryWithoutTableView
//
//  Created by Bibisara Kenesova on 22.01.2023.
//

import Foundation
import UIKit

struct someTextandColors {
    static func allTexts() -> [TextAndColors] {
        [
            .init(backgroundcolor: .systemGray, labelName: "You are soooo pretty"),
            .init(backgroundcolor: .systemRed, labelName: "Good luck!"),
            .init(backgroundcolor: .systemIndigo, labelName: "I like you ^^"),
            .init(backgroundcolor: .systemBlue, labelName: "So beautiful eyes"),
            .init(backgroundcolor: .systemMint, labelName: "You are kind"),
            .init(backgroundcolor: .systemBrown, labelName: "Have a nice day!"),
            .init(backgroundcolor: .systemPink, labelName: "Wow! You are cool"),
            .init(backgroundcolor: .systemTeal, labelName: "Dude, don't worry"),
            .init(backgroundcolor: .systemYellow, labelName: "Glad to see you"),
            .init(backgroundcolor: .systemPurple, labelName: "Ice, ice, baby"),
            .init(backgroundcolor: .systemOrange, labelName: "Everything will be fine"),
            .init(backgroundcolor: .systemGray5, labelName: "Thanks ;)"),
            .init(backgroundcolor: .systemGray3, labelName: "Hello, what's up?)"),
        ]
    }
    
}


struct TextAndColors {
    let backgroundcolor: UIColor
    let labelName: String
}
