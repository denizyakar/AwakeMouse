//
//  RunningView.swift
//  MouseFloater
//
//  Created by Ali Deniz Yakar on 27.11.2025.
//

import SwiftUI

struct RunningView: View {
    //hue starting value
    @State private var hue: Double = 0
    //shimmer variables
    @State private var isAnimating: Bool = false
    
    var body: some View {
        statusTexts
        .foregroundColor(.red)
        .hueRotation(.degrees(hue))
        //shimmerOverlay call
        .overlay(
            shimmerOverlay
                .mask(statusTexts))
        
        //Animations
        .onAppear {
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: false)) {
                isAnimating = true }
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                hue = 360 }
        }
    }
    
    private var shimmerOverlay: some View {
        LinearGradient(colors: gradientColors,
                       startPoint: .init(x: isAnimating ? 1 : -0.2, y: 0.5),
                       endPoint: .init(x: isAnimating ? 1.2 : 0, y:0.5)
        ).scaleEffect(1.5)
        .rotationEffect(.degrees(30))
    }
    
    private var statusTexts: some View {
        VStack {
            Text("Awake Mouse")
                .font(Font.custom("Minecraftia-Regular",size: 25))
         
            Text("IS RUNNING")
                .font(Font.custom("Minecraftia-Regular",size: 20))
        }
    }
    
    private var gradientColors = [
        Color.white.opacity(0),
        Color.white.opacity(0.9),
        Color.white.opacity(0)
    ]
}

#Preview {
    RunningView()
}
