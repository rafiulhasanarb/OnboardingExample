//
//  FourOnboardingView.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/25/25.
//

import SwiftUI

struct FourOnboardingView: View {
    
    @Binding var isOnboardingActive: Bool
    @State var currentPage = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.isOnboardingActive = true
                }) {
                    Text("Skip")
                        .foregroundColor(.gray)
                        .padding()
                }
            }
            
            TabView(selection: $currentPage) {
                ForEach(0..<fourModelData.count, id: \.self) { index in
                    FourOnboardingPage(imageName: fourModelData[index].imageName, title: fourModelData[index].title, description: fourModelData[index].description)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            Button(action: {
                if self.currentPage < fourModelData.count - 1 {
                    self.currentPage += 1
                } else {
                    isOnboardingActive = true
                }
            }) {
                Text(currentPage < fourModelData.count - 1 ? "Next" : "Get Started")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding([.horizontal, .bottom], 20)
            }
        }
    }
}

#Preview {
    FourOnboardingView(isOnboardingActive: .constant(true))
}
