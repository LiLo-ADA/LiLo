//
//  AppModule.swift
//  LiLo
//
//  Created by Darren Thiores on 31/03/24.
//

import Foundation

class AppModule {
    init() {
        // user
        @Provider var userApi = UserApiImpl()
        @Provider var userRepo: UserRepository = UserRepositoryImpl(
            api: userApi
        )
        
        // locker
        @Provider var lockerApi = LockerApiImpl()
        @Provider var lockerRepo: LockerRepository = LockerRepositoryImpl(
            api: lockerApi
        )
    }
}
