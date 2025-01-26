//
//  TwoOnboardingView.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/26/25.
//

import SwiftUI

struct TwoOnboardingView: View {
    
    @State private var currentIndex = 0
    
    let items: [MItem]
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(items.indices, id: \.self) { item in
                    SingleOnboardingPage(item: items[item])
                        .tag(item)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                //page indicator
                HStack(spacing: 8) {
                    ForEach(0..<items.count, id: \.self) { item in
                        Circle()
                            .fill(item == currentIndex ? Color.white : Color.white.opacity(0.4))
                            .frame(width: 8, height: 8)
                            .animation(.spring(), value: currentIndex)
                            .onTapGesture {
                                withAnimation {
                                    currentIndex = item
                                }
                            }
                    }
                }
                
                //Button
                HStack {
                    if currentIndex < items.count - 1 {
                        Button(action: {
                            withAnimation {
                                currentIndex = items.count - 1
                            }
                        }) {
                            Text("Skip")
                                .font(.headline)
                        }
                        .padding(.trailing, 8)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        if currentIndex == items.count - 1 {
                            currentIndex += 1
                        } else {
                            print("onboarding Done")
                        }
                    }) {
                        Text(currentIndex < items.count - 1 ? "Next" : "Start")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal, 8)
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(20)
                    }
                }
                .padding(.top, 14)
            }
            .padding()
        }
    }
}

#Preview {
    TwoOnboardingView(items: ExampleData)
}
