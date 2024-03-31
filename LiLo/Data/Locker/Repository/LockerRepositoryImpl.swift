//
//  LockerRepositoryImpl.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

class LockerRepositoryImpl: LockerRepository {
    private let api: LockerApi
    
    init(api: LockerApi) {
        self.api = api
    }
    
    func getLockersByArea(area: String) async -> Result<[LockerResponse], Error> {
        return await api.getLockersByArea(
            request: .init(
                area: area
            )
        )
    }
    
    func getMyLocker() async -> Result<LockerResponse, Error> {
        return await api.getMyLocker()
    }
    
    func lockIn(id: String) async -> Result<Void, Error> {
        return await api.lockIn(
            request: .init(
                id: id
            )
        )
    }
    
    func lockOut(id: String) async -> Result<Void, Error> {
        return await api.lockOut(
            request: .init(
                id: id
            )
        )
    }
    
    func reportFilled(id: String) async -> Result<Void, Error> {
        return await api.reportFilled(
            request: .init(
                id: id
            )
        )
    }
    
    func reportEmpty(id: String) async -> Result<Void, Error> {
        return await api.reportEmpty(
            request: .init(
                id: id
            )
        )
    }
    
    
}
