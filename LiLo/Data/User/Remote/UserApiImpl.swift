//
//  UserApiImpl.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

class UserApiImpl: UserApi {
    func authenticate(request: AuthenticationRequest) async -> Result<String, Error> {
        guard let url = URL(string: authenticationUrl) else {
            return .failure(
                NetworkError.others(
                    message: "an error just occurred"
                )
            )
        }
        let data = try? JSONSerialization.data(
            withJSONObject: request.toMap()
        )
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = data
            
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(
                    NetworkError.others(
                        message: response.description
                    )
                )
            }
            
            let result = try JSONDecoder().decode(
                BaseResponse<AuthenticationResponse>.self,
                from: data
            )
            let meta = result.meta
                
            if(!meta.success) {
                return .failure(
                    NetworkError.others(
                        message: response.description
                    )
                )
            }
                
            if let data = result.data {
                return .success(data.token)
            } else {
                return .failure(
                    NetworkError.others(
                        message: response.description
                    )
                )
            }
        } catch {
            return .failure(error)
        }
    }
    
    private let authenticationUrl = Constant.baseUrl + "/user/authenticate"
}
