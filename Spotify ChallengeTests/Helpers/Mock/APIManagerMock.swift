//
//  APIManagerMock.swift
//  Spotify ChallengeTests
//
//  Created by Daniel Azuaje on 9/12/22.
//

@testable import Spotify_Challenge
import Foundation

struct APIManagerMock: APIManagerProtocol {
    func perform(_ request: Spotify_Challenge.RequestProtocol, completionHandler: @escaping (Result<Data, Error>) -> ()) throws {
        do {
            print("MAMAGUEVO FALLO111", request.path)
            let data = try Data(contentsOf: URL(fileURLWithPath: request.path), options: .mappedIfSafe)
            completionHandler(.success(data))
        } catch let err {
            print("MAMAGUEVO FALLO", err)
            completionHandler(.failure(err))
        }
    }
    
//    func requestToken() async throws -> Data {}
}
