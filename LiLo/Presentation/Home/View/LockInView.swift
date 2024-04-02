//
//  LockInView.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct LockInView: View {
    let state: HomeState
    let onEvent: (HomeEvent) -> Void
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    LockInView(
        state: HomeState(),
        onEvent: { _ in }
    )
}
