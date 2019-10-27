//
//  ViewModel.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-13.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

//MARK:-Modules

import Foundation
import RealmSwift

//MARK:-Extension

extension ViewModel {
    
    func numberOfRows() -> Int {
        return notes.count
    }
    func noteElement(row: Int) -> String {
        return notes[row].note
    }
    func colorElement(row: Int) -> String {
        return notes[row].color
    }
}

//MARK:-Class ViewModel

class ViewModel {
    
//MARK:-Properties
    
    var notes: Results<Model> {
        get{
            return realm.objects(Model.self)
        }
    }
    
    var backgroundImageIndex: Int
    var editSelected: Bool
    var selectedColor: String
    var size: CGSize
    var background: String
    var selectedRow: Int
    var isEdit: Bool
    var isSettingsEdit: Bool

    init() {
        self.backgroundImageIndex = 0
        self.editSelected = false
        self.selectedColor = ColorsToSave.yellow
        self.size = Sizes.largeSize
        self.background = Background.wood
        self.selectedRow = 0
        self.isEdit = false
        self.isSettingsEdit = false
    }
    
//MARK:-Functions
    
    func saveCardData(text: String) {
        let newcard = Model()
        newcard.note = text
        newcard.color = selectedColor
        RealmSerivce.shared.create(newcard)
    }
    
    func deleteCardData() {
        RealmSerivce.shared.delete(notes[selectedRow])
    }
    
    func updateCardData(row: Int,text: String, color: String) {
        let model = notes[row]
        RealmSerivce.shared.update(model, text: text, color: color)
    }
}




