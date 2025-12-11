//
//  ZzzAnimation.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 2.12.2025.
//

import SwiftUI

struct ZzzAnimationView: View {
    var color: Color = .green.opacity(0.8)
    var fontSize: CGFloat = 12
    
    @State private var step = 0
    @State private var timer: Timer?
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Invisible layer
            Text("zzz")
                .font(.minecraftia(size: fontSize))
                .opacity(0)
                .accessibilityHidden(true)
            
            // Real text
            Text(currentText)
                .font(.minecraftia(size: fontSize))
                .foregroundColor(color)
        }
        .onAppear {
            startAnimation()
        }
        .onDisappear {
            stopAnimation()
        }
    }
    
    private var currentText: String {
        switch step {
        case 1: return "z"
        case 2: return "zZ"
        case 3: return "zZz"
        default: return ""
        }
    }
    
    private func startAnimation() {
        stopAnimation()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            step = (step + 1) % 4
        }
    }
    
    private func stopAnimation() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    ZStack {
        Color.black
        ZzzAnimationView(color: .white, fontSize: 20)
    }
    .frame(width: 100, height: 100)
}
