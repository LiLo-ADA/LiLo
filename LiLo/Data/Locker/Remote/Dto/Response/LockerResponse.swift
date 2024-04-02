//
//  LockerResponse.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

struct LockerResponse: Codable, Identifiable {
    let id: String
    let area: String
    let number: Int
    var status: Int
    var reportCount: Int
}
