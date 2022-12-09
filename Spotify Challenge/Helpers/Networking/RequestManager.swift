//
//  RequestManager.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 8/12/22.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: API, completionHandler: @escaping (Result<T, Error>) -> ()) throws
}

class RequestManager: RequestManagerProtocol {
    
    
    let apiManager: APIManagerProtocol
    
    init(apiManager: APIManagerProtocol = APIManager()) {
        self.apiManager = apiManager
    }
    
    func perform<T>(_ request: API, completionHandler: @escaping (Result<T, Error>) -> ()) throws where T : Decodable {
        try apiManager.perform(request, completionHandler: { result in
            switch result {
            case .success(let data):
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(object))
                } catch let err {
                    completionHandler(.failure(err))
                }
            case .failure(let err):
                completionHandler(.failure(err))
            }
        })
    }
}
