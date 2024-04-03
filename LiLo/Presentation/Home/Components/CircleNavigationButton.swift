//
//  CircleNavigationButton.swift
//  LiLo
//
//  Created by Darren Thiores on 03/04/24.
//

import SwiftUI

struct CircleNavigationButton: View {
    let iconName: String
    
    var body: some View {
        ZStack {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(
                    height: 17
                )
                .foregroundColor(.black)
        }
        .frame(width: 36, height: 36)
        .clipShape(Circle())
        .contentShape(Circle())
        .overlay {
            Circle()
                .stroke(.grey, lineWidth: 2)
        }
    }
}

#Preview {
    CircleNavigationButton(
        iconName: "lock.fill"
    )
}
