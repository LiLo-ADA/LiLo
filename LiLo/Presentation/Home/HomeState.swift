//
//  HomeState.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import Foundation

struct HomeState {
    var currentLocker: LockerResponse? = nil
    var selectedArea: Area = .AreaA
    var areaA: LockerState = LockerState()
    var areaB: LockerState = LockerState()
    var areaC: LockerState = LockerState()
    var areaD: LockerState = LockerState()
    var selectedLocker: LockerResponse? = nil
    var showConfirmationAlert: Bool = false
    var showReportAlert: Bool = false
    var showPasswordSheet: Bool = false
    var showPassword: Bool = false
    var isLoading: Bool = false
    var error: String? = nil
    var showErrorAlert: Bool = false
    
    struct LockerState {
        var lockers: [LockerResponse] = []
        var availability: Int = 0
        var isLoading: Bool = false
        var error: String? = nil
    }
}
