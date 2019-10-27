//
//  Model.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-07.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit
import RealmSwift

class Model: Object {
    
    @objc dynamic var  note: String = ""
    @objc dynamic var color: String = ""
    
}
