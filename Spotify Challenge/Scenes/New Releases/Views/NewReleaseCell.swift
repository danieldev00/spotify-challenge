//
//  NewReleaseCell.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import UIKit
import Kingfisher

class NewReleaseCell: UITableViewCell {
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 6.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = .appBold(size: 16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .appMedium(size: 14)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .appMedium(size: 12)
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
        contentView.addSubview(albumImageView)
        
        albumImageView.makeSquare(80)
        albumImageView.topToSuperView(padding: 8)
        albumImageView.leadingToSuperView(padding: 16)
        
        contentView.addSubview(albumNameLabel)
        
        albumNameLabel.topToSuperView(padding: 10)
        albumNameLabel.leadingTo(view: albumImageView, padding: 8)
        albumNameLabel.trailingToSuperView(padding: 16)
        albumNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        contentView.addSubview(artistNameLabel)
        
        artistNameLabel.topTo(view: albumNameLabel, padding: 2)
        artistNameLabel.leadingTo(view: albumImageView, padding: 8)
        artistNameLabel.trailingToSuperView(padding: 16)
        artistNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        contentView.addSubview(releaseDateLabel)
        
        releaseDateLabel.topTo(view: artistNameLabel, padding: 2)
        releaseDateLabel.leadingTo(view: albumImageView, padding: 8)
        releaseDateLabel.trailingToSuperView(padding: 16)
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }
    
    func setup(album: Album) {
        if let image = album.images.first?.url {
            let url = URL(string: image)!
            albumImageView.kf.setImage(with: url)
        }
        
        albumNameLabel.text = album.name
        
        artistNameLabel.text = album.artists.first?.name ?? ""
        
        releaseDateLabel.text = album.releaseDate
    }
}
