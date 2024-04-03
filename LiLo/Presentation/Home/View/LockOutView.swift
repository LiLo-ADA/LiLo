//
//  LockOutView.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI
import LocalAuthentication

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
                            .foregroundColor(.black2)
                        
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
                .foregroundColor(.black2)
            
            Spacer()
                .frame(height: 24)
            
            Button {
                onEvent(.ShowConfirmationAlert)
            } label: {
                HStack {
                    if state.isLoading {
                        ProgressView()
                    } else {
                        Text("Lock Out")
                            .font(.Headline)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .tint(Color.darkVermillion)
                .background(
                    state.isLoading ? .grey : .darkVermillion
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .buttonBorderShape(
                    .roundedRectangle(radius: 10)
                )
            }
            .disabled(state.isLoading)
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
                            //onEvent(.LockOut)
                            authenticate()
                        }
                    )
                )
            }
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 16)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Make sure that you're managing you own locker"

            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: reason
            ) { success, authenticationError in
                if success {
                    onEvent(
                        .LockOut
                    )
                } else {
                    print(authenticationError?.localizedDescription ?? "Verification failed")
//                    onEvent(
//                        .AuthenticationError(message: authenticationError?.localizedDescription ?? "We can't verify your identity")
//                    )
                }
            }
        } else {
            onEvent(
                .AuthenticationError(message: error?.localizedDescription ?? "Please, make sure to enable biometrics verification")
            )
        }
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
