//
//  FourModel.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/25/25.
//

import Foundation

struct FourModel: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
}

let fourModelData: [FourModel] = [
    FourModel(imageName: "star.fill", title: "Welcome to Onboarding", description: "Discover new features and learn more about onboarding in SwiftUI"),
    FourModel(imageName: "heart.fill", title: "Stay connected", description: "Connected with friends and family seamlessly and effortlessly"),
    FourModel(imageName: "bolt.fill", title: "Get Started", description: "Let's get you set up! and ready to explore all that SwiftUI has to offer"),
]
