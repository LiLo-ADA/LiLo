//
//  LogInView.swift
//  LiLo
//
//  Created by Sena Kristiawan on 03/04/24.
//

import SwiftUI

struct LogInView: View {
    let sessionId: Int
    @State private var email: String = ""
    @State private var isLoading: Bool = false
    @State private var error: String? = nil
    @Inject var userRepository: UserRepository
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 32) {
            //            HStack{
            //                BackButton(labelText: "Welcome")
            //                Spacer()
            //            }
            Text("Log In")
                .font(.Title2)
                .foregroundColor(.black2)
            
            HStack(spacing: 12) {
                TextField("Email", text: $email)
                    .font(.TextField)
                    .foregroundColor(.black2)
                
                Text("@bsd.idserve.net")
                    .font(.Body2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black2)
            }
            .padding(.horizontal, 12)
            .frame(height: 42)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.grey, lineWidth: 1)
            )
            
            
            GeneralButton(
                labelText: "Log In",
                disabled: email.isEmpty || isLoading,
                onClick: {
                    authenticate()
                }
            )
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
    }
    
    func authenticate() {
        Task { @MainActor in
            isLoading = true
            
            let result = await userRepository
                .authenticate(
                    email: "\(email)@bsd.idserve.net".lowercased(),
                    session: sessionId
                )
            
            switch result {
            case .success():
                isLoading = false
            case .failure(let error):
                self.error = error.localizedDescription
                isLoading = false
                
                print(error)
            }
        }
    }
}

#Preview {
    LogInView(
        sessionId: 1
    )
}
