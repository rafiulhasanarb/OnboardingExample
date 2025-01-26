//
//  ThreeOnboardingView.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/25/25.
//

import SwiftUI

struct ThreeOnboardingView: View {
    
    private let onboardingItems: [ThreeModel] = [
        ThreeModel(title: "Welcome", description: "Discover amazing features that will change your life", imageName: "star.fill"),
        ThreeModel(title: "Stay Connected", description: "Keep track of your progress and stay connected with friends", imageName: "heart.fill"),
        ThreeModel(title: "Get Started", description: "All set! Start exploring the app today", imageName: "sparkles"),
    ]
    //State variable to keep track of the active page index
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //TabView for displaying pages
                TabView(selection: $selectedIndex) {
                    ForEach(0..<onboardingItems.count, id: \.self) { item in
                        ThreePageView(item: onboardingItems[item])
                            .tag(item)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .animation(.easeInOut, value: selectedIndex)
                
                HStack {
                    //skip button
                    if selectedIndex < onboardingItems.count - 1 {
                        Button(action: {
                            selectedIndex = onboardingItems.count - 1
                        }) {
                            Text("Skip")
                                .foregroundStyle(.white.opacity(0.6))
                                .fontWeight(.semibold)
                        }
                    } else {
                        Spacer()
                            .frame(width: 60)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if selectedIndex < onboardingItems.count - 1 {
                            selectedIndex += 1
                        } else {
                            print("Onboarding completed")
                        }
                    }) {
                        Text(selectedIndex < onboardingItems.count - 1 ? "Next" : "Get Started")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 140, height: 44)
                            .background(Color.orange)
                            .cornerRadius(22)
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    ThreeOnboardingView()
}
