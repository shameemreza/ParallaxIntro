//
//  ContentView.swift
//  ParallaxIntro
//
//  Created by Shameem Reza on 9/4/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingActive {
                Onboarding()
            } else {
                Landing()
            }
        } // END ZSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
