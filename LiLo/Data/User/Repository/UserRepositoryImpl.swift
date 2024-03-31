//
//  UserRepositoryImpl.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

class UserRepositoryImpl: UserRepository {
    private let api: UserApi
    
    init(api: UserApi) {
        self.api = api
    }
    
    func authenticate(email: String, session: Int) async -> Result<Void, Error> {
        let result = await api.authenticate(
            request: .init(
                email: email,
                session: session
            )
        )
        
        switch result {
        case .success(let token):
            let keychain = KeychainSwift.shared
            keychain.set(token, forKey: "accessToken")
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "isLogin")
            
            return .success(())
        case .failure(let error):
            return .failure(error)
        }
    }
}
