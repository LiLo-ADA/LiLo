//
//  AuthenticationRequest.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

struct AuthenticationRequest: Codable {
    let email: String
    let session: Int
}

extension AuthenticationRequest {
    func toMap() -> [String: Any] {
        return [
            "email": email,
            "session": session
        ]
    }
}
