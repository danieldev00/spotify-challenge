//
//  NewReleaseEmptyCell.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import UIKit

class NewReleaseLabelCell: UITableViewCell {

    private let label: UILabel = {
        let label = UILabel()
        label.font = .appBold(size: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
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
        backgroundColor = .background
        
        let selectedBackground = UIView()
        selectedBackground.backgroundColor = .clear
        selectedBackgroundView = selectedBackground
        
        contentView.addSubview(label)
        
        label.centerVertically()
        label.pinHorizontalEdges(padding: 16)
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setup(title: String) {
        label.text = title
    }
}
