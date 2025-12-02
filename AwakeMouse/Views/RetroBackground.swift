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
            // 1. Zemin Rengi (Koyu Gri/Siyah)
            Color(red: 0.1, green: 0.1, blue: 0.12) // Hafif mavimsi siyah
                .ignoresSafeArea()
            
            // 2. Izgara (Grid)
            RetroGridShape()
                .stroke(Color.green.opacity(0.15), lineWidth: 1)
        }
    }
}

// Izgara Çizim Mantığı
struct RetroGridShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let step: CGFloat = 40 // Karelerin büyüklüğü
        
        // Dikey çizgiler
        for x in stride(from: 0, to: rect.width, by: step) {
            path.move(to: CGPoint(x: x, y: 0))
            path.addLine(to: CGPoint(x: x, y: rect.height))
        }
        
        // Yatay çizgiler
        for y in stride(from: 0, to: rect.height, by: step) {
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: rect.width, y: y))
        }
        
        return path
    }
}

#Preview {
    RetroBackground()
        .frame(width: 300, height: 200)
}
