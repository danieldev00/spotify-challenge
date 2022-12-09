//
//  LoadingCell.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import UIKit

class LoadingCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        let spinner = UIActivityIndicatorView(style: .medium)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(spinner)
        spinner.startAnimating()

        spinner.centerHorizontally()
        spinner.centerVertically()
    }

}
