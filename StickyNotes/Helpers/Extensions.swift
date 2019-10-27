//
//  Extensions.swift
//  StickyNotes
//
//  Created by XCodeClub on 2019-10-07.
//  Copyright © 2019 XCodeClub. All rights reserved.
//

import UIKit



extension UIView {
    
    func visualButton() {
        self.layer.cornerRadius = self.frame.height/2
        
    }
    func border() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 4
    }

    func shadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 5
    }
    
    func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 3
        pulse.initialVelocity = 0.7
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
  
    func cancelBorder(){
        self.layer.borderWidth = 0
    }
}



