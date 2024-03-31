//
//  UserApi.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

protocol UserApi {
    func authenticate(
        request: AuthenticationRequest
    ) async -> Result<String, Error>
}
