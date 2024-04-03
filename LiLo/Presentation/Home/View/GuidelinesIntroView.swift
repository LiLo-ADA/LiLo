//
//  GuidelineIntroView.swift
//  LiLo
//
//  Created by Benedick Wijayaputra on 03/04/24.
//

import SwiftUI

struct GuidelinesIntroView: View {
    @State var isButtonEnabled = false
    @State var countdown = 5
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                VStack(alignment: .center, spacing: 32) {
                    Text("Read our guidelines:")
                        .font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading, spacing:8) {
                        
                        Text("1. Lock in after storing your belongings")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        VStack() {
                            Text("Make sure to place your belongings inside the locker before locking your selected locker in the app")
                                .font(.Body2)
                                .padding(.leading, 16)
                                .padding(.bottom, 4)
                            Spacer(minLength: 12)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        
                        
                        Text("2. Lock out after taking your belongings")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        VStack() {
                            Text("Remember to take your belongings out of your locker before locking out of the locker in the app")
                                .font(.Body2)
                                .padding(.leading, 16)
                                .padding(.bottom, 4)
                            Spacer(minLength: 12)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        
                        Text("3. Be mindful of active sessions")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        VStack() {
                            Text("Consider locking out of your locker after your session ended. This will allow others to use the empty locker")
                                .font(.Body2)
                                .padding(.leading, 16)
                                .padding(.bottom, 4)
                            Spacer(minLength: 12)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        }
                        
                        Text("4. Report any false lockers")
                            .font(.headline)
                            .foregroundStyle(Color(.darkTosca))
                        
                        VStack() {
                            Text("If you found any inaccuracies with the locker availability status, please report the issue using the designated button.")
                                .font(.Body2)
                                .padding(.leading, 16)
                                .padding(.bottom, 4)
                            
                        }
                    }
    
                    VStack(spacing: 8){
                        NavigationLink {
                            HomeScreen()
                        } label: {
                            Text("I Understand")
                                .font(.Headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 48)
                        }
                        .tint(Color.darkTosca)
                        .padding(.horizontal, 16)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(
                            .roundedRectangle(radius: 10)
                        )
                        .disabled(!isButtonEnabled)
                        
                        if countdown != 0 {
                            Text("\(countdown)s")
                                .padding(.top, 10)
                                .foregroundColor(.darkTosca)
                        }
                        
                    }
                }
                
                .onAppear {
                    // Start a timer when the view appears
                    //                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    //                            isButtonEnabled = true // Enable the button after 5 seconds
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        if countdown > 0 {
                            countdown -= 1
                        } else {
                            isButtonEnabled = true // Enable the button after countdown reaches 0
                            timer.invalidate() // Stop the timer
                        }
                    }
                }
                
                Spacer()
            }.padding(16)
        }
    }
}

#Preview {
    NavigationStack {
        GuidelinesIntroView()
    }
}
