//
//  ArtistInfoVIew.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 9/12/22.
//

import UIKit

class ArtistInfoView: UIView {
    lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = .appBold(size: 24)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genresLabel: UILabel = {
        let label = UILabel()
        label.font = .appMedium(size: 16)
        label.text = "Genrea"
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genresValueLabel: UILabel = {
        let label = UILabel()
        label.font = .appRegular(size: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.font = .appMedium(size: 16)
        label.text = "Followers"
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followersValueLabel: UILabel = {
        let label = UILabel()
        label.font = .appRegular(size: 14)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(artistNameLabel)
        
        artistNameLabel.topToSuperView()
        artistNameLabel.pinHorizontalEdges()
        artistNameLabel.setHeight(35)
        
        addSubview(genresLabel)
        
        genresLabel.topTo(view: artistNameLabel, padding: 4)
        genresLabel.pinHorizontalEdges()
        genresLabel.setHeight(24)
        
        addSubview(genresValueLabel)
        
        genresValueLabel.topTo(view: genresLabel, padding: 0)
        genresValueLabel.pinHorizontalEdges()
        genresValueLabel.setHeight(20)

        
        addSubview(followersLabel)
        
        followersLabel.topTo(view: genresValueLabel, padding: 4)
        followersLabel.pinHorizontalEdges()
        followersLabel.setHeight(24)
        
        addSubview(followersValueLabel)
        
        followersValueLabel.topTo(view: followersLabel, padding: 0)
        followersValueLabel.pinHorizontalEdges()
        followersValueLabel.setHeight(20)
        followersValueLabel.bottomToSuperView()
    }
    
    func setup(artist: Artist) {
        artistNameLabel.text = artist.name
        
        genresValueLabel.text = (artist.genres ?? []).joined(separator: ", ")
        
        followersValueLabel.text = "\(artist.followers?.total ?? 0)"
    }
}
