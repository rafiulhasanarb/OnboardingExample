//
//  OnboardingPage.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/21/25.
//

import SwiftUI

struct OnboardingPage: View {
    
    let item: OnboardingItem
    @State private var iconScale: CGFloat = 0.6
    
    var body: some View {
        ZStack {
            item.backgroundGradient
                .ignoresSafeArea()
            
            VStack {
                WaveShape()
                    .fill(Color.white.opacity(0.15))
                    .frame(height: 250)
                    .rotationEffect(.degrees(180))
                Spacer()
            }
            
            VStack(spacing: 25) {
                Image(systemName: item.systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .shadow(color: Color.black.opacity(0.25), radius: 6, x: 0, y: 4)
                    .scaleEffect(iconScale)
                    .onAppear {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.6).repeatForever(autoreverses: true)) {
                            iconScale = 1.0
                        }
                    }
                
                Text(item.title)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, x: 1, y: 1)
                
                Text(item.subtitle)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 1)
            }
            .padding(.bottom, 60)
        }
    }
}

#Preview {
    OnboardingPage(item: OnboardingItem(title: "Let's get started", subtitle: "Discover the power of SwiftUI onboarding!", systemImageName: "globe.europe.africa.fill", backgroundGradient: LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing)))
}
