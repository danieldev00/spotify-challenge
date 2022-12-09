//
//  UIView+Ext.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import UIKit

extension UIView {
    
    @discardableResult private func safeSuperview() -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        guard let view = self.superview else {
            fatalError("You need to have a superview before you can add contraints")
        }
        return view
    }
    
    
    @discardableResult func makeSquare(_ size: CGFloat) -> [NSLayoutConstraint] {
        let constraints = [
            widthAnchor.constraint(equalToConstant: size),
            heightAnchor.constraint(equalToConstant: size)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }

    @discardableResult func topToSuperView(padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            topAnchor.constraint(equalTo: safeSuperview().topAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    @discardableResult func topTo(view: UIView, padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            topAnchor.constraint(equalTo: view.bottomAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    
    @discardableResult func leadingToSuperView(padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: safeSuperview().leadingAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    @discardableResult func leadingTo(view: UIView, padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    
    @discardableResult func trailingToSuperView(padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            trailingAnchor.constraint(equalTo: safeSuperview().trailingAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    @discardableResult func trailingTo(view: UIView, padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    
    @discardableResult func bottomToSuperView(padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            bottomAnchor.constraint(equalTo: safeSuperview().bottomAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    @discardableResult func bottomTo(view: UIView, padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            bottomAnchor.constraint(equalTo: view.topAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    @discardableResult func pinHorizontalEdges(padding: CGFloat = 0.0) -> [NSLayoutConstraint] {
        let constraints = [
            leadingAnchor.constraint(equalTo: safeSuperview().leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: safeSuperview().trailingAnchor, constant: padding)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    @discardableResult func centerVertically() -> [NSLayoutConstraint] {
        let constraints = [
            centerYAnchor.constraint(equalTo: safeSuperview().centerYAnchor)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    @discardableResult func centerHorizontally() -> [NSLayoutConstraint] {
        let constraints = [
            centerXAnchor.constraint(equalTo: safeSuperview().centerXAnchor)
        ]
        
        safeSuperview().addConstraints(constraints)
        
        return constraints
    }
    
    func fullToSuperView() {
        let constraints = [
            topAnchor.constraint(equalTo: safeSuperview().topAnchor),
            leadingAnchor.constraint(equalTo: safeSuperview().leadingAnchor),
            trailingAnchor.constraint(equalTo: safeSuperview().trailingAnchor),
            bottomAnchor.constraint(equalTo: safeSuperview().bottomAnchor)
        ]
        
        safeSuperview().addConstraints(constraints)
    }
}
