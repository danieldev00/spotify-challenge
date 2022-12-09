//
//  GenreCell.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 9/12/22.
//

import UIKit


class GenreCell: UICollectionViewCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .appBold(size: 22)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.backgroundColor = .random.withAlphaComponent(0.75)
        contentView.layer.cornerRadius = 5.0
        
        contentView.addSubview(titleLabel)
        
        titleLabel.topToSuperView(padding: 8)
        titleLabel.bottomToSuperView(padding: 8)
        titleLabel.pinHorizontalEdges(padding: 8)
    }
    
    func setup(with genre: String) {
        titleLabel.text = genre
    }
}
