//
//  ThreePageView.swift
//  OnboardingExample
//
//  Created by Rafiul Hasan on 1/25/25.
//

import SwiftUI

struct ThreePageView: View {
    
    let item: ThreeModel
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundStyle(.green.opacity(0.95))
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
                .padding(.bottom, 40)
            
            Text(item.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(item.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}

#Preview {
    ThreePageView(item: ThreeModel(title: "Get Started", description: "All set! Start exploring the app today", imageName: "sparkles"))
}
