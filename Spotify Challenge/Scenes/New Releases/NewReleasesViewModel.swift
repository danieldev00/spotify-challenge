//
//  NewReleasesViewModel.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

typealias OnSuccess<T> = (T) -> ()


enum NewReleaseSections {
    case releases([Album])
    case empty
    case loading
}

final class NewReleasesViewModel {
    private let requestManager = RequestManager()
    private var albums: [Album] = []
    private var hasMore: Bool = true
    
    func fetchNewReleases(completion: @escaping OnSuccess<[NewReleaseSections]>) {
        guard hasMore else { return }
        
        if albums.isEmpty {
            completion([.loading])
        }
        
        do {
            try requestManager.perform(API.newReleases(offset: albums.count)) { [weak self] (result: Result<ReleaseContainer, Error>) in
                guard let self = self else { return }
                switch result {
                case .success(let container):
                    self.hasMore = container.albums.hasMore
                    self.albums.append(contentsOf: container.albums.items)
                    
                    if self.albums.isEmpty {
                        completion([.empty])
                        return
                    }
                    
                    var section = [NewReleaseSections.releases(self.albums)]
                    if container.albums.hasMore {
                        section += [.loading]
                    }
                    
                    completion(section)
                    
                    return
                case .failure(let err):
                    print("Error", err)
                    completion([.empty])
                }
            }
        } catch {}
    }
}
