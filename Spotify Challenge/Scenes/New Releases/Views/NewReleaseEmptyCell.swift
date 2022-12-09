//
//  NewReleaseEmptyCell.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import UIKit

class NewReleaseEmptyCell: UITableViewCell {

    private let label: UILabel = {
        let label = UILabel()
        label.font = .appBold(size: 16)
        label.text = "Nothing to see here!"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupView() {
        contentView.addSubview(label)
        
        label.centerVertically()
        label.pinHorizontalEdges(padding: 16)
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
