//
//  LiLoApp.swift
//  LiLo
//
//  Created by Darren Thiores on 27/03/24.
//

import SwiftUI

@main
struct LiLoApp: App {
    init() {
        AppModule()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(.darkTosca)
        }
    }
}
