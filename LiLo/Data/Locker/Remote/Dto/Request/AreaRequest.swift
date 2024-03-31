//
//  AreaRequest.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

struct AreaRequest: Codable {
    let area: String
}

extension AreaRequest {
    func toMap() -> [String: Any] {
        return [
            "area": area
        ]
    }
}
