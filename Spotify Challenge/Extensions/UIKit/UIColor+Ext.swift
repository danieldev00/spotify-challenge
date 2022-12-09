//
//  UIColor+Ext.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 7/12/22.
//

import UIKit

extension UIColor {
    static let accent = UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1.0)
    
    static let background = UIColor(red: 25/255, green: 20/255, blue: 20/255, alpha: 1.0)
    
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
