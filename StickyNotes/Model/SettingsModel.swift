//
//  Settingsmodel.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import Foundation

struct SettingsModel {
    
    var backGroundView : String
   
    func bacgroundArray() -> [SettingsModel] {
        
        var listOfBackgrounds = [SettingsModel]()
        let first = SettingsModel(backGroundView: "wood")
        let second = SettingsModel(backGroundView: "table")
        
        listOfBackgrounds.append(contentsOf: [first,second])
        return listOfBackgrounds
    }
}

