//
//  CircleButton.swift
//  LiLo
//
//  Created by Darren Thiores on 02/04/24.
//

import SwiftUI

struct CircleButton: View {
    let iconName: String
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            ZStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        height: 17
                    )
                    .foregroundColor(.black2)
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
}

#Preview {
    CircleButton(
        iconName: "lock.fill",
        onClick: {  }
    )
}
