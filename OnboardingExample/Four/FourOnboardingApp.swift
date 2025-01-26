//
//  FourOnboardingApp.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/25/25.
//

import SwiftUI

struct FourOnboardingApp: View {
    
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    
    var body: some View {
        if isOnboardingCompleted {
            MainAppView()
        } else {
            FourOnboardingView(isOnboardingActive: $isOnboardingCompleted)
        }
    }
}

#Preview {
    FourOnboardingApp()
}

struct MainAppView: View {
    
    var body: some View {
        NavigationView {
            Text("Welcome to the Onboarding Example!")
                .font(.largeTitle)
                .padding()
                .navigationTitle("Home")
        }
    }
}
