//
//  LockerApiImpl.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

class LockerApiImpl: LockerApi {
    func getLockersByArea(request: AreaRequest) async -> Result<[LockerResponse], Error> {
        let url = URL(string: getLockersByAreaUrl)
        
        do {
            let result: Result<BaseResponse<[LockerResponse]>, Error> = try await postRequest(
                request: request.toMap(),
                url: url
            )
            
            switch result {
            case .success(let response):
                let meta = response.meta
                
                if(!meta.success) {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
                
                if let data = response.data {
                    return .success(data)
                } else {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
    
    func getMyLocker() async -> Result<LockerResponse, Error> {
        let url = URL(string: getLockerUrl)
        
        do {
            let result: Result<BaseResponse<LockerResponse>, Error> = try await getRequest(
                url: url
            )
            
            switch result {
            case .success(let response):
                let meta = response.meta
                
                if(!meta.success) {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
                
                if let data = response.data {
                    return .success(data)
                } else {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
    
    func lockIn(
        request: LockerIdRequest
    ) async -> Result<Void, Error> {
        let url = URL(string: lockInUrl)
        
        do {
            let result: Result<PlainResponse, Error> = try await postRequest(
                request: request.toMap(),
                url: url
            )
            
            switch result {
            case .success(let response):
                let meta = response.meta
                
                if(!meta.success) {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
                
                return .success(())
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
    
    func lockOut(
        request: LockerIdRequest
    ) async -> Result<Void, Error> {
        let url = URL(string: lockOutUrl)
        
        do {
            let result: Result<PlainResponse, Error> = try await postRequest(
                request: request.toMap(),
                url: url
            )
            
            switch result {
            case .success(let response):
                let meta = response.meta
                
                if(!meta.success) {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
                
                return .success(())
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
    
    func reportFilled(
        request: LockerIdRequest
    ) async -> Result<Void, Error> {
        let url = URL(string: reportFilledUrl)
        
        do {
            let result: Result<PlainResponse, Error> = try await postRequest(
                request: request.toMap(),
                url: url
            )
            
            switch result {
            case .success(let response):
                let meta = response.meta
                
                if(!meta.success) {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
                
                return .success(())
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
    
    func reportEmpty(
        request: LockerIdRequest
    ) async -> Result<Void, Error> {
        let url = URL(string: reportEmptyUrl)
        
        do {
            let result: Result<PlainResponse, Error> = try await postRequest(
                request: request.toMap(),
                url: url
            )
            
            switch result {
            case .success(let response):
                let meta = response.meta
                
                if(!meta.success) {
                    return .failure(
                        NetworkError.others(
                            message: meta.message
                        )
                    )
                }
                
                return .success(())
            case .failure(let error):
                return .failure(error)
            }
        } catch {
            return .failure(error)
        }
    }
    
    private let getLockersByAreaUrl = Constant.baseUrl + "/locker/all"
    private let getLockerUrl = Constant.baseUrl + "/locker/email"
    private let lockInUrl = Constant.baseUrl + "/locker/in"
    private let lockOutUrl = Constant.baseUrl + "/locker/out"
    private let reportFilledUrl = Constant.baseUrl + "/locker/filled"
    private let reportEmptyUrl = Constant.baseUrl + "/locker/empty"
}
