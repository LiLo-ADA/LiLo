//
//  Area.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import Foundation

enum Area: String, CaseIterable {
    case AreaA = "A"
    case AreaB = "B"
    case AreaC = "C"
    case AreaD = "D"
    
    static func getPlace(
        area: Area
    ) -> String {
        switch area {
        case .AreaA:
            return "Front Aisle"
        case .AreaB:
            return "Middle Aisle"
        case .AreaC:
            return "Side Pantry"
        case .AreaD:
            return "Middle Pantry"
        }
    }
}
