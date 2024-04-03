//
//  HomeViewModel.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import Foundation
import SwiftUI

@MainActor class HomeViewModel: ObservableObject {
    @Published var state = HomeState()
    @Inject var lockerRepository: LockerRepository
    @AppStorage("isUsingLocker") var isUsingLocker: Bool = false
    private let keychain = KeychainSwift.shared
    
    @Published var password: String = ""
    
    init() {
        if isUsingLocker {
            fetchLocker()
        } else {
             getLockers()
        }
        
        Task {
            password = keychain.get("password") ?? ""
        }
    }
    
    func onEvent(event: HomeEvent) {
        switch event {
        case .SelectArea(area: let area):
            state.selectedArea = area
            state.selectedLocker = nil
        case .Refresh:
            refresh()
        case .SelectLocker(locker: let locker):
            state.selectedLocker = locker
        case .LockIn:
            lockIn()
        case .LockOut:
            lockOut()
        case .ReportFilled:
            reportFilled()
        case .ReportEmpty:
            reportEmpty()
        case .DismissConfirmationAlert:
            state.showConfirmationAlert = false
        case .ShowConfirmationAlert:
            state.showConfirmationAlert = true
        case .DismissReportAlert:
            state.showReportAlert = false
        case .ShowReportAlert:
            state.showReportAlert = true
        case .AuthenticationError(message: let message):
            Task {
                state.error = message
                state.showErrorAlert = true
            }
        case .ShowPasswordSheet:
            Task {
                state.showPasswordSheet = true
            }
        case .TogglePasswordVisible:
            Task {
                state.showPassword.toggle()
            }
        case .OnPasswordChange(password: let password):
            Task {
                self.password = password
                keychain.set(password, forKey: "password")
            }
        case .OnDone:
            Task {
                state.showPasswordSheet = false
                state.showPassword = false
            }
        }
    }
    
    private func lockIn() {
        Task {
            guard let lockerId = state.selectedLocker?.id else {
                return
            }
            
            state.isLoading = true
            
            let result = await lockerRepository
                .lockIn(id: lockerId)
            
            switch result {
            case .success():
                state.isLoading = false
                state.currentLocker = state.selectedLocker
                isUsingLocker = true
            case .failure(let error):
                state.error = error.localizedDescription
                state.showErrorAlert = true
            }
        }
    }
    
    private func lockOut() {
        Task {
            guard let lockerId = state.currentLocker?.id else {
                return
            }
            
            state.isLoading = true
            
            let result = await lockerRepository
                .lockOut(id: lockerId)
            
            switch result {
            case .success():
                state.isLoading = false
                state.currentLocker = nil
                isUsingLocker = false
                
                refresh()
            case .failure(let error):
                state.error = error.localizedDescription
                state.showErrorAlert = true
            }
        }
    }
    
    private func reportFilled() {
        Task {
            guard let selectedLocker = self.state.selectedLocker else {
                return
            }
            
            state.isLoading = true
            
            let result = await lockerRepository
                .reportFilled(id: selectedLocker.id)
            
            switch result {
            case .success():
                state.isLoading = false
                
                var newSelectedLocker = selectedLocker
                newSelectedLocker.reportCount += 1
                
                if newSelectedLocker.reportCount >= 3 {
                    newSelectedLocker.status = 1
                }
                
                if newSelectedLocker.reportCount <= -3 {
                    newSelectedLocker.status = 2
                }
                
                var newLockers: [LockerResponse] = []
                
                switch state.selectedArea {
                case .AreaA:
                    newLockers = state.areaA.lockers
                case .AreaB:
                    newLockers = state.areaB.lockers
                case .AreaC:
                    newLockers = state.areaC.lockers
                case .AreaD:
                    newLockers = state.areaD.lockers
                }
                
                newLockers.removeAll(
                    where: { locker in
                        locker.id == newSelectedLocker.id
                    }
                )
                
                newLockers.append(newSelectedLocker)
                newLockers.sort(
                    by: { a, b in a.number < b.number}
                )
                
                switch state.selectedArea {
                case .AreaA:
                    state.areaA.lockers = newLockers
                case .AreaB:
                    state.areaB.lockers = newLockers
                case .AreaC:
                    state.areaC.lockers = newLockers
                case .AreaD:
                    state.areaD.lockers = newLockers
                }
                
                state.selectedLocker = newSelectedLocker
            case .failure(let error):
                state.error = error.localizedDescription
                state.showErrorAlert = true
            }
        }
    }
    
    private func reportEmpty() {
        Task {
            guard let selectedLocker = self.state.selectedLocker else {
                return
            }
            
            state.isLoading = true
            
            let result = await lockerRepository
                .reportEmpty(id: selectedLocker.id)
            
            switch result {
            case .success():
                state.isLoading = false
                
                var newSelectedLocker = selectedLocker
                newSelectedLocker.reportCount -= 1
                
                if newSelectedLocker.reportCount >= 3 {
                    newSelectedLocker.status = 1
                }
                
                if newSelectedLocker.reportCount <= -3 {
                    newSelectedLocker.status = 2
                }
                
                var newLockers: [LockerResponse] = []
                
                switch state.selectedArea {
                case .AreaA:
                    newLockers = state.areaA.lockers
                case .AreaB:
                    newLockers = state.areaB.lockers
                case .AreaC:
                    newLockers = state.areaC.lockers
                case .AreaD:
                    newLockers = state.areaD.lockers
                }
                
                newLockers.removeAll(
                    where: { locker in
                        locker.id == newSelectedLocker.id
                    }
                )
                
                newLockers.append(newSelectedLocker)
                newLockers.sort(
                    by: { a, b in a.number < b.number}
                )
                
                switch state.selectedArea {
                case .AreaA:
                    state.areaA.lockers = newLockers
                case .AreaB:
                    state.areaB.lockers = newLockers
                case .AreaC:
                    state.areaC.lockers = newLockers
                case .AreaD:
                    state.areaD.lockers = newLockers
                }
                
                state.selectedLocker = newSelectedLocker
            case .failure(let error):
                state.error = error.localizedDescription
                state.showErrorAlert = true
            }
        }
    }
    
    private func refresh() {
        Task {
            state.areaA.lockers = []
            state.areaA.error = nil
            
            state.areaB.lockers = []
            state.areaB.error = nil
            
            state.areaC.lockers = []
            state.areaC.error = nil
            
            state.areaD.lockers = []
            state.areaD.error = nil
            
            getLockers()
        }
    }
    
    private func getLockers() {
        for area in Area.allCases {
            Task {
                switch area {
                case .AreaA:
                    if !state.areaA.lockers.isEmpty {
                        return
                    }
                    
                    state.areaA.isLoading = true
                    
                    await fetchLockers(
                        area: .AreaA,
                        saveResult: { result in
                            state.areaA.isLoading = false
                            state.areaA.lockers = result
                            state.areaA.availability = result.filter { locker in locker.status == 1 }.count
                        },
                        errorResult: { error in
                            state.areaA.isLoading = false
                            state.areaA.error = error
                        }
                    )
                case .AreaB:
                    if !state.areaB.lockers.isEmpty {
                        return
                    }
                    
                    state.areaB.isLoading = true
                    
                    await fetchLockers(
                        area: .AreaB,
                        saveResult: { result in
                            state.areaB.isLoading = false
                            state.areaB.lockers = result
                            state.areaB.availability = result.filter { locker in locker.status == 1 }.count
                        },
                        errorResult: { error in
                            state.areaB.isLoading = false
                            state.areaB.error = error
                        }
                    )
                case .AreaC:
                    if !state.areaC.lockers.isEmpty {
                        return
                    }
                    
                    state.areaC.isLoading = true
                    
                    await fetchLockers(
                        area: .AreaC,
                        saveResult: { result in
                            state.areaC.isLoading = false
                            state.areaC.lockers = result
                            state.areaC.availability = result.filter { locker in locker.status == 1 }.count
                        },
                        errorResult: { error in
                            state.areaC.isLoading = false
                            state.areaC.error = error
                        }
                    )
                case .AreaD:
                    if !state.areaD.lockers.isEmpty {
                        return
                    }
                    
                    state.areaD.isLoading = true
                    
                    await fetchLockers(
                        area: .AreaD,
                        saveResult: { result in
                            state.areaD.isLoading = false
                            state.areaD.lockers = result
                            state.areaD.availability = result.filter { locker in locker.status == 1 }.count
                        },
                        errorResult: { error in
                            state.areaD.isLoading = false
                            state.areaD.error = error
                        }
                    )
                }
            }
        }
    }
    
    private func fetchLockers(
        area: Area? = nil,
        saveResult: ([LockerResponse]) -> Void,
        errorResult: (String) -> Void
    ) async {
        let result = await lockerRepository
            .getLockersByArea(area: area?.rawValue ?? state.selectedArea.rawValue)
        
        switch result {
        case .success(let result):
            saveResult(result)
        case .failure(let error):
            print(error)
            errorResult(error.localizedDescription)
        }
    }
    
    private func fetchLocker() {
        Task {
            state.isLoading = true
            
            let result = await lockerRepository
                .getMyLocker()
            
            switch result {
            case .success(let result):
                state.isLoading = false
                state.currentLocker = result
            case .failure(let error):
                state.isLoading = false
                state.error = error.localizedDescription
            }
        }
    }
}
