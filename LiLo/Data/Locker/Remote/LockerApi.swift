//
//  LockerApi.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

protocol LockerApi {
    func getLockersByArea(
        request: AreaRequest
    ) async -> Result<[LockerResponse], Error>
    
    func getMyLocker() async -> Result<LockerResponse, Error>
    
    func lockIn(
        request: LockerIdRequest
    ) async -> Result<Void, Error>
    
    func lockOut(
        request: LockerIdRequest
    ) async -> Result<Void, Error>
    
    func reportFilled(
        request: LockerIdRequest
    ) async -> Result<Void, Error>
    
    func reportEmpty(
        request: LockerIdRequest
    ) async -> Result<Void, Error>
}
