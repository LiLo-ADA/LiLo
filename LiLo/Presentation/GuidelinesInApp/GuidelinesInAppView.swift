//
//  GuidelinesInAppView.swift
//  LiLo
//
//  Created by Glenn Leonali on 03/04/24.
//

import SwiftUI

struct GuidelinesInAppView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Locker area map")
                        .font(.title2)
                        .bold()
                    Image("MAP AREA")
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Guidelines")
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 4)
                        Text("1. Lock in after storing your belongings")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        Text("Make sure to place your belongings inside the locker before locking your selected locker in the app")
                            .font(.Body2)
                            .padding(.leading, 16)
                            .padding(.bottom, 4)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Text("2. Lock out after taking your belongings")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        Text("Remember to take your belongings out of your locker before locking out of the locker in the app")
                            .font(.Body2)
                            .padding(.leading, 16)
                            .padding(.bottom, 4)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Text("3. Be mindful of active sessions")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        Text("Consider locking out of your locker after your session ended. This will allow others to use the empty locker")
                            .font(.Body2)
                            .padding(.leading, 16)
                            .padding(.bottom, 4)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Text("4. Report any false lockers")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        Text("If you found any inaccuracies with the locker availability status, please report the issue using the designated button.")
                            .font(.Body2)
                            .padding(.leading, 16)
                            .padding(.bottom, 4)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                        .frame(height: 80)
                }
                
            }.padding(16)
        }
        .navigationTitle("Guidelines")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        GuidelinesInAppView()
    }
}
