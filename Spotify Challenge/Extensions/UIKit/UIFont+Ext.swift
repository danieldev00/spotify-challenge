//
//  UIFont+Ext.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import UIKit

public extension UIFont {
    class func appRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Gotham-Light", size: size) ?? .systemFont(ofSize: size)
    }
       
    class func appMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "Gotham-Medium", size: size) ?? .systemFont(ofSize: size, weight: .medium)
    }
    
    class func appBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Gotham-Bold", size: size) ?? .boldSystemFont(ofSize: size)
    }
}
