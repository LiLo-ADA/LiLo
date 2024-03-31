//
//  LockerResponse.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

struct LockerResponse: Codable {
    let id: String
    let area: String
    let number: Int
    let status: Int
    let reportCount: Int
    let password: String?
}
