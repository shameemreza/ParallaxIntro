//
//  Home.swift
//  ParallaxIntro
//
//  Created by Shameem Reza on 9/4/22.
//

import SwiftUI

struct Landing: View {
    
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            Spacer()
            
            ZStack {
                
                CircleGroup(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("img-landing")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating
                    )
            } // END ZSTACK
            
            // MARK: - BODY
            
            Text("Work and you’ll get what you need; work harder and you’ll get what you want.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            // MARK: FOOTER
            
            HStack {
                Button(action: {
                    withAnimation {
                        isOnboardingActive = true
                    }
                }) {
                    
                    Image(systemName: "chevron.backward.2")
                        .imageScale(.large)
                    
                    Text("Go Back")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                } // END GO BACK BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(Color("colorR"))
                
                Button(action: {
                    withAnimation {
                        isOnboardingActive = true
                    }
                }) {
                    Text("Sign In")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                    
                    Image(systemName: "chevron.forward.2")
                        .imageScale(.large)
                }  // END LOGIN BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .tint(Color("colorG"))
            } // END FOTTER TOP
            
            HStack {
                Text("No Account?")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                
                Button(action: {
                    withAnimation {
                        isOnboardingActive = true
                    }
                }) {
                    Text("Register Now!")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.light)
                        .foregroundColor(.teal)
                }
            } // END FOOTER BOTTOM
            
            Spacer()
            
        } // END VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
