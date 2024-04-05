//
//  GeneralButton.swift
//  LiLo
//
//  Created by Sena Kristiawan on 03/04/24.
//

import SwiftUI

struct GeneralButton: View {
    let labelText: String
    let disabled: Bool
    let onClick: () -> Void
    
    var body: some View {
        Button(
            action: onClick,
            label: {
                Text(labelText)
                    .foregroundColor(Color.white)
                    .font(.Headline)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(
                                disabled ? .grey : Color.darkTosca
                            )
                    )
            }
        )
    }
}

#Preview {
    GeneralButton(labelText: "Log in", disabled: false,onClick: {  })
}
