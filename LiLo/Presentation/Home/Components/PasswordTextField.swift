//
//  PasswordSheet.swift
//  LiLo
//
//  Created by Darren Thiores on 03/04/24.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var text: String
    let passwordVisible: Bool
    let placeholder: String
    let onTogglePassword: () -> Void
    var disabled: Bool = false
    
    @FocusState.Binding var textFieldFocus: Bool
    
    var body: some View {
        HStack {
            Group{
                if passwordVisible {
                    TextField(
                        placeholder,
                        text: $text
                    )
                    .font(.Body)
                    .focused($textFieldFocus)
                } else {
                    SecureField(
                        placeholder,
                        text: $text
                    )
                    .font(.Body)
                    .focused($textFieldFocus)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: passwordVisible)
            
            Spacer()
                .frame(width: 8)
            
            Button {
                onTogglePassword()
            } label: {
                Image(systemName: !passwordVisible ? "eye.slash" : "eye")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 16
                    )
                    .foregroundColor(.black)
            }
        }
        .tint(.darkTosca)
        .padding(.horizontal, 16)
        .frame(height: 32)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(
                    .grey,
                    style: StrokeStyle(lineWidth: 1.0)
                )
        )
        .cornerRadius(8)
        .disabled(disabled)
    }
}

#Preview {
    PasswordTextField(
        text: .constant("abc"),
        passwordVisible: true,
        placeholder: "password",
        onTogglePassword: {  },
        textFieldFocus: FocusState().projectedValue
    )
}
