//
//  API.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

enum API: RequestProtocol {
    case newReleases(offset: Int)
    case artist(id: String)
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
    
    var urlParams: [String : String] {
        switch self {
        case .newReleases(let offset):
            return ["offset": "\(offset)"]
        default:
            return [:]
        }
    }
        
    var requestType: RequestType {
        return .get
    }
}
