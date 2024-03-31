//
//  LockerRepository.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

protocol LockerRepository {
    func getLockersByArea(
        area: String
    ) async -> Result<[LockerResponse], Error>
    
    func getMyLocker() async -> Result<LockerResponse, Error>
    
    func lockIn(
        id: String
    ) async -> Result<Void, Error>
    
    func lockOut(
        id: String
    ) async -> Result<Void, Error>
    
    func reportFilled(
        id: String
    ) async -> Result<Void, Error>
    
    func reportEmpty(
        id: String
    ) async -> Result<Void, Error>
}
