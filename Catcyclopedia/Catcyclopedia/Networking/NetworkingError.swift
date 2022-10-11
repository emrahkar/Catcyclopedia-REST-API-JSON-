//
//  APIError.swift
//  Catcyclopedia
//
//  Created by Emrah Karabulut on 11.10.2022.
//

import Foundation

enum NetworkingError: LocalizedError {
    
    case badURL
    case badURLResponse(url: URL)
    case unknown
    
    var errorDescription: String? {
        switch self {
            case .badURL: return "Bad URL"
            case .badURLResponse(url: let url): return "Bad response from \(url)"
            case .unknown: return "unknown error occured"
        }
    }
}
