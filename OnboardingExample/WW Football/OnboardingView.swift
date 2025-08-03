//
//  OnboardingView.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 8/3/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var totalPages = 3
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    @State private var buttonScale: CGFloat = 1.0
    
    // Onboarding data model
    private let pages: [WWScoreOnboardingPage] = [
        WWScoreOnboardingPage(
            title: "Welcome to",
            headline: "WW Scores",
            description: "Your One Stop Live Sports Scores that tailored to your favorite sports",
            imageName: "sports.welcome"
        ),
        WWScoreOnboardingPage(
            title: "Live Updates",
            headline: "Real-time Scores",
            description: "Get instant notifications for your favorite teams and leagues",
            imageName: "sports.live"
        ),
        WWScoreOnboardingPage(
            title: "Personalized",
            headline: "Your Sports",
            description: "Customize your feed to follow only the sports and teams you care about",
            imageName: "sports.personalized"
        )
    ]
    
    var body: some View {
//        if hasCompletedOnboarding {
//            MainContentView()
//        } else {
            ZStack {
                // Dynamic background that changes with page
                LinearGradient(
                    gradient: Gradient(colors: [Color("Background1"), Color("Background2")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                //.edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        // Back button (conditionally shown)
                        if currentPage > 0 { // Show except last two pages
                            Button(action: {
                                withAnimation {
                                    currentPage = max(0, currentPage - 1)
                                }
                            }) {
                                HStack {
                                    Image(systemName: "chevron.left")
                                }
                                .foregroundColor(.blue)
                            }
                            .padding(.leading)
                            
                        }
                        
                        Spacer()
                        
                        Button(action: { }) {
                            Text("Skip")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        // Animated page content
                        TabView(selection: $currentPage) {
                            ForEach(pages.indices, id: \.self) { index in
                                OnboardingPageView(page: pages[index])
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .indexViewStyle(.page(backgroundDisplayMode: .never))
                        
                        // Page indicator with animation
                        HStack(spacing: 10) {
                            ForEach(pages.indices, id: \.self) { index in
                                Capsule()
                                    .frame(width: index == currentPage ? 24 : 8, height: 8)
                                    .foregroundColor(index == currentPage ? .green : .gray.opacity(0.4))
                                    .animation(.easeInOut, value: currentPage)
                            }
                        }
                        .padding(.bottom, 10)
                        
                        // Animated action button
                        Button(action: handleButtonAction) {
                            HStack {
                                Text(currentPage < pages.count - 1 ? "Next" : "Get Started")
                                if currentPage == pages.count - 1 {
                                    Image(systemName: "arrow.right")
                                }
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(15)
                            .scaleEffect(buttonScale)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 40)
                        .padding(.bottom, 30)
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in buttonScale = 0.95 }
                                .onEnded { _ in buttonScale = 1.0 }
                        )
                    }
                }
            }
            .transition(.opacity)
//        }
    }
    
    private func handleButtonAction() {
        if currentPage < pages.count - 1 {
            withAnimation(.spring()) {
                currentPage += 1
            }
        } else {
            withAnimation {
                hasCompletedOnboarding = false
            }
        }
    }
}

// Onboarding page data structure
struct WWScoreOnboardingPage: Identifiable {
    let id = UUID()
    let title: String
    let headline: String
    let description: String
    let imageName: String
}

// Individual page view
struct OnboardingPageView: View {
    let page: WWScoreOnboardingPage
    
    var body: some View {
        VStack(spacing: 25) {
            // Image with nice shadow and animation
            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                .padding(.top, 40)
            
            // Text content
            VStack(spacing: 8) {
                Text(page.title)
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text(page.headline)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text(page.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
        }
    }
}

// Preview with both color schemes
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView()
                .preferredColorScheme(.light)
            
            OnboardingView()
                .preferredColorScheme(.dark)
        }
    }
}

// Main content view placeholder
struct MainContentView: View {
    var body: some View {
        Text("Main App Content")
            .font(.largeTitle)
    }
}
