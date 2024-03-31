//
//  LockerIdRequest.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

struct LockerIdRequest: Codable {
    let id: String
}

extension LockerIdRequest {
    func toMap() -> [String: Any] {
        return [
            "id": id
        ]
    }
}
