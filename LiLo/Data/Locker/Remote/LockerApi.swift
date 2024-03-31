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
    
    func lockIn() async -> Result<Void, Error>
    
    func lockOut() async -> Result<Void, Error>
    
    func reportFilled() async -> Result<Void, Error>
    
    func reportEmpty() async -> Result<Void, Error>
}
