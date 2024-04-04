//
//  WelcomeView.swift
//  LiLo
//
//  Created by Sena Kristiawan on 03/04/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 32) {
            Text("Welcome to LiLo").font(.Title2)
            Image("Lilo")
                .resizable()
                .scaledToFit()
                .frame(width: 361, height: 225)
//                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .rotationEffect(.degrees(270))
                
            VStack(alignment: .center, spacing: 12) {
                Text("Tell us what your role in Academy")
                    .font(.headline)
                WelcomeButton(labelText: "Student (Morning Session)")
                WelcomeButton(labelText: "Student (Afternoon Session)")
                WelcomeButton(labelText: "Academy Staff")
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    NavigationStack {
        WelcomeView()
    }
    .accentColor(.darkTosca)
}
