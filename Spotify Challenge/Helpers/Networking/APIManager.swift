//
//  APIManager.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: RequestProtocol, completionHandler: @escaping (Result<Data, Error>) -> ()) throws
}

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: RequestProtocol, completionHandler: @escaping (Result<Data, Error>) -> ()) throws {
        try URLSession.shared.dataTask(with: request.createURLRequest(authToken: Constants.API.auth)) { (data, response, error) in
            if let err = error {
                completionHandler(.failure(err))
                return
            }
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                return
            }
            
            completionHandler(.success(data))
        }.resume()
    }
}
