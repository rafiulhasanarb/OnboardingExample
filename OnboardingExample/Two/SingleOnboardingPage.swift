//
//  SingleOnboardingPage.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/25/25.
//

import SwiftUI

struct SingleOnboardingPage: View {
    
    let item: MItem
    
    var body: some View {
        ZStack {
            item.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Image(systemName: item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .scaleEffect(1)
                    .animation(.spring(response: 0.6, dampingFraction: 0.6), value: 1)
                
                Text(item.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 16)
                    .opacity(1)
                    .animation(.easeIn(duration: 1.0), value: 1)
                
                Text(item.subtitle)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .opacity(1)
                    .animation(.easeIn(duration: 1.0), value: 1)
            }
            .padding()
        }
        .onAppear {
            withAnimation {
                
            }
        }
        .onDisappear {
            
        }
    }
}

#Preview {
    SingleOnboardingPage(item: MItem( title: "Welcome", subtitle: "Start exploring our app.", imageName: "sun.max.fill", backgroundColor: Color.orange))
}
