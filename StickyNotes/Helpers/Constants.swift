//
//  ItemSize.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-23.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

struct Sizes {
    static let smallSize = CGSize(width: (UIScreen.main.bounds.width/2) - 10, height: UIScreen.main.bounds.width/2)
    static let largeSize = CGSize(width: (UIScreen.main.bounds.width/3) - 10, height: UIScreen.main.bounds.width/3)
}

struct Background {
    static let wood = "wood"
    static let table = "table"
}

struct Colors {
    static let yellow = UIColor(displayP3Red: 255/255, green: 241/255, blue: 113/255, alpha: 1)
    static let green = UIColor(displayP3Red: 116/255, green: 242/255, blue: 91/255, alpha: 1)
    static let red = UIColor(displayP3Red: 231/255, green: 81/255, blue: 83/255, alpha: 1)
}

struct FontSize {
    static let small = 10
    static let large = 14
}

struct Titles {
    static let small = "small"
    static let large = "large"
    static let delete = "delete"
    static let settings = "settings"
}

struct ColorsToSave {
    static let yellow = "yellow"
    static let green = "green"
    static let red = "red"
}
