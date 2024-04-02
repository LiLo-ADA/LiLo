//
//  Dummy.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import Foundation

class Dummy {
    static let locker: LockerResponse = .init(
        id: "123",
        area: "A",
        number: 1,
        status: 1,
        reportCount: 0
    )
    
    static let lockers: [LockerResponse] = (1...27).map { i in
        .init(
            id: "\(i)",
            area: "A",
            number: i,
            status: 1,
            reportCount: 0
        )
    }
}
