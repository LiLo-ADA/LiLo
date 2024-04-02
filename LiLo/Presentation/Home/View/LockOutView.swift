//
//  LockOutView.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct LockOutView: View {
    @Binding var state: HomeState
    let onEvent: (HomeEvent) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            if let locker = state.currentLocker {
                var numberText: String {
                    if locker.number < 10 {
                        "0\(locker.number)"
                    } else {
                        "\(locker.number)"
                    }
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Selected Locker")
                            .font(.Headline)
                            .foregroundColor(.black)
                        
                        Text("\(locker.area) - \(numberText)")
                            .font(.LargeTitle)
                            .foregroundColor(.darkTosca)
                    }
                    
                    Spacer()
                }
            }
            
            Spacer()
            
            Text("Remember to take your belongings from the locker before locking out")
                .font(.Body2)
                .padding(.horizontal, 48)
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 24)
            
            Button {
                onEvent(.ShowConfirmationAlert)
            } label: {
                Text("Lock Out")
                    .font(.Headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 48)
            }
            .tint(Color.darkVermillion)
            .padding(.horizontal, 16)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(
                .roundedRectangle(radius: 10)
            )
            .disabled(state.selectedLocker?.status == 2)
            .alert(isPresented: $state.showConfirmationAlert) {
                Alert(
                    title: Text("Lock out of your locker?")
                        .font(.Headline),
                    message: Text(
                        "Remember to take your belongings from the locker before locking out"
                        )
                        .font(.Body2),
                    primaryButton: .destructive(
                        Text("No")
                            .font(.Body),
                        action: {
                            onEvent(.DismissConfirmationAlert)
                        }
                    ),
                    secondaryButton: .default(
                        Text("Yes")
                            .font(.Body)
                            .fontWeight(.semibold),
                        action: {
                            onEvent(.DismissConfirmationAlert)
                            onEvent(.LockOut)
                        }
                    )
                )
            }
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
    }
}

#Preview {
    LockOutView(
        state: .constant(
            HomeState(
                currentLocker: Dummy.lockers[5]
            )
        ),
        onEvent: { _ in }
    )
}
