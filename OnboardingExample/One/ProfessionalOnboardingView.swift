//
//  ProfessionalOnboardingView.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/22/25.
//

import SwiftUI

struct ProfessionalOnboardingView: View {
    
    let items: [OnboardingItem]
    @State private var currentIndex: Int = 0
    
    var body: some View {
        ZStack {
            // Main tabView
            TabView(selection: $currentIndex) {
                ForEach(items.indices, id: \.self) { index in
                    OnboardingPage(item: items[index])
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            //Overlay - custom page indicator and buttons
            VStack {
                Spacer()
                
                //custom page indicator
                HStack(spacing: 8) {
                    ForEach(0..<items.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(index == currentIndex ? Color.white : Color.white.opacity(0.4))
                            .frame(width: index == currentIndex ? 16 : 0, height: 8)
                            .animation(.spring, value: currentIndex)
                    }
                }
                .padding(.top, 16)
                
                //bottom buttons
                HStack(spacing: 20) {
                    //skip button
                    if currentIndex < items.count - 1 {
                        Button {
                            self.currentIndex = items.count - 1
                        } label: {
                            Text("Skip")
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundStyle(.black)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(12)
                        }
                    }
                    
                    Button {
                        if currentIndex == items.count - 1 {
                            self.currentIndex += 1
                        } else {
                            print("Onboarding Completed")
                        }
                    } label: {
                        Text(currentIndex < items.count - 1 ? "Next" :"Start")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(12)
                    }
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ProfessionalOnboardingView(items: [OnboardingItem]())
}
