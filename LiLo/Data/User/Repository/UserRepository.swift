//
//  UserRepository.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

protocol UserRepository {
    func authenticate(
        email: String,
        session: Int
    ) async -> Result<Void, Error>
}
