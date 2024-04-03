//
//  PasswordSheet.swift
//  LiLo
//
//  Created by Darren Thiores on 03/04/24.
//

import SwiftUI
import LocalAuthentication

struct PasswordSheet: View {
    @Binding var text: String
    let showPassword: Bool
    let onEvent: (HomeEvent) -> Void
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Password")
                .font(.Title2)
                .foregroundColor(.black2)
            
            PasswordTextField(
                text: $text,
                passwordVisible: showPassword,
                placeholder: "optional",
                onTogglePassword: {
                    if showPassword {
                        onEvent(
                            .TogglePasswordVisible
                        )
                    } else {
                        authenticate()
                    }
                },
                textFieldFocus: $isFocused
            )
            .keyboardType(.decimalPad)
            
            Spacer()
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 16)
        .onAppear {
            isFocused = true
        }
        .onDisappear {
            isFocused = false
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard){
                Button("Reset"){
                    text = ""
                }
                .foregroundColor(.darkVermillion)
                
                Spacer()
                
                Button("Done"){
                    isFocused = false
                    onEvent(
                        .OnDone
                    )
                }
                .foregroundColor(.darkTosca)
            }
        }
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
                        .TogglePasswordVisible
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
    PasswordSheet(
        text: .constant(""),
        showPassword: false,
        onEvent: { _ in  }
    )
}
