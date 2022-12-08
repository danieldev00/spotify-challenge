//
//  RequestProtocol.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 7/12/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
}

protocol RequestProtocol {
    var path: String { get }
    
    var headers: [String: String] { get }
    
    var params: [String: Any] { get }
    
    var urlParams: [String: String?] { get }
    
    var addAuthorizationToken: Bool { get }
    
    var requestType: RequestType { get }
}

extension RequestProtocol {
    var host: String {
        Constants.API.host
    }
    
    var addAuthorizationToken: Bool {
        true
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }
    
    var headers: [String: String] {
        [:]
    }
    
    
    func createURLRequest(authToken: String) throws -> URLRequest {
        guard let url = URL(string: host + path)
        else { throw NetworkError.invalidURL }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue
        
        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if addAuthorizationToken {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }
        
        return urlRequest
    }
    
    
}
