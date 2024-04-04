//
//  GeneralButton.swift
//  LiLo
//
//  Created by Sena Kristiawan on 03/04/24.
//

import SwiftUI

struct GeneralButton: View {
    let labelText: String
    var body: some View {
        Button(action: {} , label: {
            Text(labelText)
                .foregroundColor(Color.white)
                .font(.headline)
        })
        
        .frame(maxWidth: .infinity, maxHeight: 54)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.darkTosca)
        )
    }
}

#Preview {
    GeneralButton(labelText: "")
}
