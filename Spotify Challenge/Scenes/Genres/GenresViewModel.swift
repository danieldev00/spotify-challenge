//
//  GenresViewModel.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 9/12/22.
//

import Foundation

final class GenresViewModel {
    private let requestManager = RequestManager()
    
    init() {
        ///
    }
    
    func fetchArtist(completion: @escaping OnSuccess<Artist>) {
        do {
            try requestManager.perform(.genres) { [weak self] (result: Result<Artist, Error>) in
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
