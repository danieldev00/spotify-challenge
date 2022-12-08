//
//  Album.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

struct Album: Codable {
    let albumType: String
    let artists: [Artist]
    let href: String?
    let id: String
    let images: [Image]
    let name, releaseDate: String
    let totalTracks: Int
    let type: String
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case albumType = "album_type"
        case artists
        case href, id, images, name
        case releaseDate = "release_date"
        case totalTracks = "total_tracks"
        case type, uri
    }
}

struct Image: Codable {
    let height: Int?
    let url: String?
    let width: Int?
}
