//
//  HomeEvent.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import Foundation

enum HomeEvent {
    case SelectArea(area: Area)
    case SelectLocker(locker: LockerResponse)
    case LockIn
    case Report
    case DismissConfirmationAlert
    case ShowConfirmationAlert
    case DismissReportAlert
    case ShowDismissAlert
}
