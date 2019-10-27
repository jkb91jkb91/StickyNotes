//
//  RealmSerivce.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-10.
//  Copyright © 2019 XCodeClub. All rights reserved.
//
//MARK:-Modules

import Foundation
import RealmSwift

//MARK:-Public variable

let realm = try! Realm()

//MARK:-class

class RealmSerivce {
    
    private init() {}
    
    static let shared = RealmSerivce()

    //MARK: - Functions
    func create<T:Object>(_ object: T) {
       do {
            try realm.write {
                realm.add(object)
            }
        } catch {}
    }
    
    func delete<T:Object>(_ object: T) {
      do {
            try realm.write {
                realm.delete(object)
            }
        } catch {}
    }
    
    func update(_ object: Model, text: String, color: String) {
        do {
        try realm.write {
            object.note = text
            object.color = color
            }
        } catch {}
    }
    
}



