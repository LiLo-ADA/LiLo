//
//  ContentView.swift
//  LiLo
//
//  Created by Darren Thiores on 27/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "applelogo")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, team 5!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
