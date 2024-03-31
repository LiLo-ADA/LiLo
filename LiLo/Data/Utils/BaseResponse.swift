//
//  BaseResponse.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let meta: Meta
    let data: T?
    
    struct Meta: Codable {
        let success: Bool
        let message: String
    }
}
