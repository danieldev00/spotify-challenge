//
//  ArtistController.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 7/12/22.
//

import UIKit
import Kingfisher

class ArtistController: UIViewController {
    lazy var artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var infoView = ArtistInfoView()
    
    var viewModel: ArtistViewModel
    
    init(viewModel: ArtistViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        view.addSubview(artistImageView)
        
        artistImageView.topToSuperView()
        artistImageView.pinHorizontalEdges()
        artistImageView.heightAnchor.constraint(equalTo: artistImageView.widthAnchor, multiplier: 320/269).isActive = true
        
        
        
        let gradientView = GradientView(gradientStartColor: .background, gradientEndColor: .clear)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        
        gradientView.topToSuperView()
        gradientView.pinHorizontalEdges()
        gradientView.heightAnchor.constraint(equalTo: artistImageView.heightAnchor).isActive = true
        
        view.addSubview(infoView)
        
        infoView.topTo(view: artistImageView, padding: -32)
        infoView.pinHorizontalEdges(padding: 16)
        
        
        viewModel.fetchArtist { [weak self] artist in
            DispatchQueue.main.async {
                if let image = artist.images?.first?.url {
                    let url = URL(string: image)!
                    self?.artistImageView.kf.setImage(with: url)
                }
                
                self?.infoView.setup(artist: artist)
            }
            
        }
    }

}
