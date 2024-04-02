//
//  HomeScreen.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isUsingLocker {
                LockOutView(
                    state: $viewModel.state,
                    onEvent: { event in
                        viewModel.onEvent(
                            event: event
                        )
                    }
                )
            } else {
                LockInView(
                    state: $viewModel.state,
                    onEvent: { event in
                        viewModel.onEvent(
                            event: event
                        )
                    }
                )
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 6) {
                    CircleButton(
                        iconName: "lock.fill",
                        onClick: {
                            
                        }
                    )
                    
                    CircleButton(
                        iconName: "questionmark",
                        onClick: {
                            
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}
