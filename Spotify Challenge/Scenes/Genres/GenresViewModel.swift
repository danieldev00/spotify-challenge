//
//  GenresViewModel.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 9/12/22.
//

import Foundation

final class GenresViewModel {
    private let requestManager = RequestManager()
    
    func fetchGenres(completion: @escaping OnSuccess<[String]>) {
        do {
            try requestManager.perform(API.genres) { (result: Result<Genres, Error>) in
                switch result {
                case .success(let genres):
                    completion(genres.genres)
                    return
                case .failure(let err):
                    print("Error", err)
                }
            }
        } catch {}
    }
}
