//
//  FourOnboardingPage.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/25/25.
//

import SwiftUI

struct FourOnboardingPage: View {
    
    let imageName: String
    let title: String
    let description: String
    
    @State private var appear = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .foregroundStyle(.blue)
                .opacity(appear ? 1 : 0)
                .animation(.easeInOut(duration: 1.0), value: appear)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .opacity(appear ? 1 : 0)
                .animation(.easeInOut(duration: 1.0), value: appear)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .opacity(appear ? 1 : 0)
                .animation(.easeInOut(duration: 1.0), value: appear)
            
            Spacer()
        }
        .padding()
        .onAppear {
            appear = true
        }
    }
}

#Preview {
    //FourOnboardingPage()
}
