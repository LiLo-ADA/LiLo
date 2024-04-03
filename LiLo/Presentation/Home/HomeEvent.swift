//
//  HomeEvent.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import Foundation

enum HomeEvent {
    case SelectArea(area: Area)
    case Refresh
    case SelectLocker(locker: LockerResponse)
    case LockIn
    case LockOut
    case ReportFilled
    case ReportEmpty
    case DismissConfirmationAlert
    case ShowConfirmationAlert
    case DismissReportAlert
    case ShowReportAlert
    case ShowPasswordSheet
    case AuthenticationError(message: String)
    case OnPasswordChange(password: String)
    case TogglePasswordVisible
    case OnDone
}
