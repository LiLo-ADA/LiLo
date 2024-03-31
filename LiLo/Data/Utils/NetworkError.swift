//
//  NetworkError.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURLRequest
    case noResponse
    case decoding
    case unauthorized
    case others(message: String)
    case underlying(Error)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURLRequest:
            return "Invalid URL"
        case .noResponse:
            return "No response from server"
        case .decoding:
            return "Error while decoding info"
        case .unauthorized:
            return "Unauthorized access"
        case .others(let message):
            return message
        case .underlying(_):
            return "Something went wrong"
        }
    }
}

