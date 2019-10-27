//
//  Cell.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-07.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit

//MARK:-class

class Cell: UICollectionViewCell {
    

    //MARK:-Outlets
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    //MARK:-Default settings for Cells
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageV.shadow()
    }
 
}
