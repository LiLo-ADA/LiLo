//
//  ContentView.swift
//  LiLo
//
//  Created by Darren Thiores on 27/03/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLogin") var isLogin: Bool = false
    @AppStorage("showGuidelines") var showGuidelines: Bool = true
    
    var body: some View {
        if !isLogin {
            NavigationStack {
                WelcomeView()
            }
        } else {
            if showGuidelines {
                GuidelinesIntroView()
            } else {
                NavigationStack {
                    HomeScreen()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
