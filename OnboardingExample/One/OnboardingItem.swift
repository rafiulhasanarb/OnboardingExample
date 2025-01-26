//
//  OnboardingItem.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/21/25.
//

import SwiftUI
import Foundation

struct OnboardingItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemImageName: String
    let backgroundGradient: LinearGradient
}

//MARK: Example onboarding Data
let onboardingItems: [OnboardingItem] = [
    OnboardingItem(
        title: "Welcome to Aboard",
        subtitle: "Discover the power of SwiftUI onboarding!",
        systemImageName: "globe.europe.africa.fill",
        backgroundGradient: LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
        ),
    OnboardingItem(
        title: "Lighting Up Your App",
        subtitle: "Make your app onboarding interactive and fun!",
        systemImageName: "sun.max.fill",
        backgroundGradient: LinearGradient(gradient: Gradient(colors: [.pink, .orange]), startPoint: .top, endPoint: .bottom)
    ),
    OnboardingItem(
        title: "Get Started Now",
        subtitle: "Explore our feature and take your experience to the next level!",
        systemImageName: "sparkles",
        backgroundGradient: LinearGradient(gradient: Gradient(colors: [.indigo, .purple]), startPoint: .bottomLeading, endPoint: .topTrailing)
    )
    ]
        
struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        //starting at bottom left
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        // curve up
        path.addCurve(
            to: CGPoint(x: rect.width * 0.8, y: rect.midY + 0.9),
            control1: CGPoint(x: rect.width * 0.2, y: rect.midY * 0.7),
            control2: CGPoint(x: rect.width * 0.6, y: rect.midY + 1.1)
        )
        // curve down
        path.addCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY),
            control1: CGPoint(x: rect.width * 0.9, y: rect.midY * 0.8),
            control2: CGPoint(x: rect.width * 0.95, y: rect.midY * 1.2)
        )
        //complete the shape
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
