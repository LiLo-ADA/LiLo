//
//  PlainResponse.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

struct PlainResponse: Codable {
    let meta: Meta
    
    struct Meta: Codable {
        let success: Bool
        let message: String
    }
}
