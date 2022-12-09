//
//  APIRequestMock.swift
//  Spotify ChallengeTests
//
//  Created by Daniel Azuaje on 9/12/22.
//

import Foundation

@testable import Spotify_Challenge

enum APIMock: RequestProtocol {
    case newReleases
    case artist
    case genres
    
    var requestType: RequestType {
        return .get
    }

    var path: String {
        var fileName = ""
        switch self {
        case .newReleases:
            fileName = "NewReleases"
            break
        case .artist:
            fileName = "Artist"
            break
        case .genres:
            fileName = "Genres"
            break
        }
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json")
        else { return "" }
        return path
    }
}
