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
            TextField("Email", text: $email)
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding(.horizontal, 12)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.grey, lineWidth: 1))
            

            GeneralButton(labelText: "Log In", onClick: {
                authenticate()
            })
        }
        .padding(.horizontal, 16)
        Spacer()
    }
    
    func authenticate() {
        Task { @MainActor in
            isLoading = true
            
            let result = await userRepository
                .authenticate(
                    email: email,
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
