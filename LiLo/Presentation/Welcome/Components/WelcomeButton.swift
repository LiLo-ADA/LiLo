//
//  WelcomeButton.swift
//  LiLo
//
//  Created by Sena Kristiawan on 03/04/24.
//

import SwiftUI

struct WelcomeButton: View {
    let labelText: String
    let sessionId: Int
    
    var body: some View {
        NavigationLink {
            LogInView(
                sessionId: sessionId
            )
        } label: {
            Text(labelText)
                .foregroundStyle(Color.black)
                .font(.headline)
                .frame(maxWidth: .infinity, maxHeight: 52)
            .padding(12)
            .font(.headline)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.grey, lineWidth: 2))
        }
        
    }
}

#Preview {
    WelcomeButton(labelText: "", sessionId: 1)
}
