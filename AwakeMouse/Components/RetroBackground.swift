//
//  RetroBackground.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 2.12.2025.
//

import SwiftUI

struct RetroBackground: View {
    var body: some View {
        ZStack {
            // Background Color
            Color(red: 0.05, green: 0.05, blue: 0.07)
                .ignoresSafeArea()
            
            // Grid Overlay
            RetroGridShape()
                // dash: [4, 2] -> 4 pixels filled, 2 pixels empty.
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [4, 2]))
                .foregroundColor(Color.green.opacity(0.18))
                .ignoresSafeArea()
        }
    }
}

struct RetroGridShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let step: CGFloat = 30
        
        // Vertical lines
        for x in stride(from: 0, to: rect.width, by: step) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.height))
        }
        
        // Horizontal lines
        for y in stride(from: 0, to: rect.height, by: step) {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: rect.width, y: y))
        }
        
        return path
    }
}

#Preview {
    RetroBackground()
}
