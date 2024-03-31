import Foundation
import SwiftUI

func postRequest<T: Decodable>(
    request: [String: Any],
    url: URL?
) async throws -> Result<T, Error> {
    guard let url = url else {
        return .failure(
            NetworkError.others(
                message: "an error just occurred"
            )
        )
    }
    
    let data = try? JSONSerialization.data(withJSONObject: request)
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = data
    
    let keyChain = KeychainSwift.shared
    guard let token = keyChain.get("access_token") else {
        return .failure(NetworkError.unauthorized)
    }

    urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    do {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.noResponse)
        }
        
        guard httpResponse.statusCode == 200 else {
            print("post code: \(httpResponse.statusCode)")
            
            return .failure(
                NetworkError.others(
                    message: "\(httpResponse.statusCode)"
                )
            )
        }
        
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return .success(result)
    } catch {
        return .failure(error)
    }
}

func getRequest<T: Decodable>(
    url: URL?
) async throws -> Result<T, Error> {
    guard let url = url else {
        return .failure(
            NetworkError.others(
                message: "an error just occurred"
            )
        )
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"
    
    let keyChain = KeychainSwift.shared
    guard let token = keyChain.get("access_token") else {
        return .failure(NetworkError.unauthorized)
    }

    urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    
    do {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(NetworkError.noResponse)
        }
        
        guard httpResponse.statusCode == 200 else {
            print("get code: \(httpResponse.statusCode)")
            
            return .failure(
                NetworkError.others(
                    message: "\(httpResponse.statusCode)"
                )
            )
        }
        
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return .success(result)
    } catch {
        return .failure(error)
    }
}
