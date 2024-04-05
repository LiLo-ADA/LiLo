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
                .foregroundStyle(Color.black2)
                .font(.headline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .contentShape(RoundedRectangle(cornerRadius: 10))
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .font(.Headline)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.grey, lineWidth: 2)
                )
        }
        
    }
}

#Preview {
    NavigationStack {
        WelcomeButton(labelText: "Morning Session", sessionId: 1)
    }
}
