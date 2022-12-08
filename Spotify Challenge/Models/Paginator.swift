//
//  Paginator.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

struct Paginator: Codable {
    let href: String?
    let items: [Album]
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
}
