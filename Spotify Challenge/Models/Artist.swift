//
//  Artist.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

// MARK: - Artist
struct Artist: Codable {
    let followers: Followers?
    let genres: [String]?
    let href: String
    let id: String
    let images: [Image]?
    let name: String
    let popularity: Int?
    let type: String
    let uri: String?
}

// MARK: - Followers
struct Followers: Codable {
    let href: String?
    let total: Int
}
