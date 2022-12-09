//
//  ArtistViewModel.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 9/12/22.
//

import Foundation

final class ArtistViewModel {
    private let requestManager = RequestManager()
    private var artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
    
    func fetchArtist(completion: @escaping OnSuccess<Artist>) {
        do {
            try requestManager.perform(.artist(id: artist.id)) { [weak self] (result: Result<Artist, Error>) in
                guard let self = self else { return }
                switch result {
                case .success(let artist):
                    self.artist = artist
                    completion(artist)
                    return
                case .failure(let err):
                    print("Error", err)
                }
            }
        } catch {}
    }
}
