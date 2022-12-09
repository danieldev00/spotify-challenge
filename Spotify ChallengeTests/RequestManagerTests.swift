//
//  RequestManagerTests.swift
//  Spotify ChallengeTests
//
//  Created by Daniel Azuaje on 9/12/22.
//

import XCTest

@testable import Spotify_Challenge

final class RequestManagerTests: XCTestCase {
    
    private var requestManager: RequestManagerProtocol?
    
    override func setUp() {
        super.setUp()

        requestManager = RequestManager(
            apiManager: APIManagerMock()
        )
    }
    
    func testRequestNewReleases() throws {
        let expectation = self.expectation(description: "release")
        var container: ReleaseContainer?
        
        try requestManager?.perform(APIMock.newReleases) { (result: Result<ReleaseContainer, Error>) in
            switch result {
            case .success(let result):
                container = result
                expectation.fulfill()
                
                                
                return
            case .failure(let err):
                print("Error", err)
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertNotNil(container?.albums.next)
        let first = container?.albums.items.first
        
        XCTAssertEqual(first?.name, "SIXDO")
        XCTAssertEqual(first?.releaseDate, "2022-12-02")
        XCTAssertEqual(first?.images.isEmpty, false)
        XCTAssertNotNil(first?.href)
    }
    
    func testRequestArtist() throws {
        let expectation = self.expectation(description: "artist")
        var artist: Artist?
        
        try requestManager?.perform(APIMock.artist) { (result: Result<Artist, Error>) in
            switch result {
            case .success(let result):
                artist = result
                expectation.fulfill()
                                
                return
            case .failure(let err):
                print("Error", err)
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertEqual(artist?.name, "Feid")
        XCTAssertEqual(artist?.followers?.total, 2859746)
        XCTAssertNotEqual(artist?.images?.isEmpty, true)
    }
    
    func testRequestGenres() throws {
        let expectation = self.expectation(description: "genres")
        var genres: [String]?
        
        try requestManager?.perform(APIMock.genres) { (result: Result<Genres, Error>) in
            switch result {
            case .success(let result):
                genres = result.genres
                expectation.fulfill()
                
                return
            case .failure(let err):
                print("Error", err)
            }
        }
        
        waitForExpectations(timeout: 2, handler: nil)
        
        XCTAssertNotEqual(genres?.isEmpty, true)
        XCTAssertEqual(genres?.first, "acoustic")
    }
    
}
