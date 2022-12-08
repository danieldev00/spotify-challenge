//
//  API.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

enum API: RequestProtocol {
    case newReleases
    case artist(id: Int)
    case genre
}

extension API {    
    var path: String {
        switch self {
        case .newReleases:
            return "/browse/new-releases"
        case .artist(let id):
            return "/artists/\(id)"
        case .genre:
            return "/recommendations/available-genre-seeds"
        }
    }
        
    var requestType: RequestType {
        return .get
    }
}
