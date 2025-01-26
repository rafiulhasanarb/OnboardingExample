//
//  MItem.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/26/25.
//

import SwiftUI
import Foundation

struct MItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let backgroundColor: Color
}

 // Example Data
 let ExampleData: [MItem] = [
    MItem( title: "Welcome", subtitle: "Start exploring our app.", imageName: "sun.max.fill", backgroundColor: Color.orange),
    MItem(title: "Fast & Easy", subtitle: "Quickly access what you need.", imageName: "bolt.fill", backgroundColor: Color.blue),
    MItem(title: "Secure", subtitle: "Your data is safe with us.", imageName: "lock.shield.fill", backgroundColor: Color.green),
    MItem(title: "Let's Get Started!", subtitle: "Continue to explore our app.", imageName: "sparkles", backgroundColor: Color.pink)]
