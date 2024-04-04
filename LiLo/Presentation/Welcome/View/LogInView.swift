//
//  LogInView.swift
//  LiLo
//
//  Created by Sena Kristiawan on 03/04/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    
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
            

            GeneralButton(labelText: "Log In")
        }
        .padding(.horizontal, 16)
        Spacer()
    }
}

#Preview {
    LogInView()
}
