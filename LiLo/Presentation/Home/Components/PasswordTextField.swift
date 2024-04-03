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
                    .foregroundColor(.black2)
                    .focused($textFieldFocus)
                } else {
                    SecureField(
                        placeholder,
                        text: $text
                    )
                    .font(.Body)
                    .foregroundColor(.black2)
                    .focused($textFieldFocus)
                }
            }
            .animation(.easeInOut(duration: 0.2), value: passwordVisible)
            
            Spacer()
                .frame(width: 8)
            
            Text("#")
                .font(.Body)
                .foregroundColor(.black2)
            
            HStack(alignment: .center, spacing: 0) {
                Divider()
                    .background(Color.grey)
                
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
                        .bold()
                        .foregroundColor(
                            !passwordVisible ? .darkVermillion : .darkTosca
                        )
                }
            }
        }
        .tint(.darkTosca)
        .padding(.horizontal, 8)
        .frame(height: 40)
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
