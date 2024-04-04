//
//  BackButton.swift
//  LiLo
//
//  Created by Sena Kristiawan on 03/04/24.
//

import SwiftUI

struct BackButton: View {
    let labelText: String
    var body: some View {
        HStack{
            Image(systemName: "chevron.backward")
            Text(labelText)
        }
        .foregroundColor(Color.darkTosca)
        .font(.headline)
    }
}

#Preview {
    BackButton(labelText: "")
}
