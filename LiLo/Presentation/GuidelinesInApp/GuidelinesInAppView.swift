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
            VStack(alignment: .leading, spacing: 24) {
                Text("Locker area map")
                    .font(.Title2)
                    .bold()
                    .foregroundColor(.black2)
                
                Image("MapArea")
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Guidelines")
                        .font(.Title2)
                        .foregroundColor(.black2)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Lock in after storing your belongings")
                            .font(.Headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        Text("Make sure to place your belongings inside the locker before locking your selected locker in the app")
                            .font(.Body2)
                            .foregroundColor(.black2)
                            .padding(.leading, 16)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("2. Lock out after taking your belongings")
                            .font(.Headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        Text("Remember to take your belongings out of your locker before locking out of the locker in the app")
                            .font(.Body2)
                            .foregroundColor(.black2)
                            .padding(.leading, 16)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("3. Be mindful of active sessions")
                            .font(.Headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        Text("Consider locking out of your locker after your session ended. This will allow others to use the empty locker")
                            .font(.Body2)
                            .foregroundColor(.black2)
                            .padding(.leading, 16)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("4. Report any false lockers")
                            .font(.Headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        Text("If you found any inaccuracies with the locker availability status, please report the issue using the designated button.")
                            .font(.Body2)
                            .foregroundColor(.black2)
                            .padding(.leading, 16)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
            
            Spacer()
                .frame(height: 60)
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
