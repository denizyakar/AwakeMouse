//
//  MoveToStopText.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 3.12.2025.
//

import SwiftUI

struct MoveToStopText: View {
    @State private var textAnimating: Bool = false
    
    private let fontName = "Minecraftia-Regular"
    
    var body: some View {
        VStack {
            Text("Move Mouse to Stop!")
                .font(.custom(fontName, size: 15))
                .opacity(textAnimating ? 0.9 : 0.02)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                textAnimating.toggle()
            }
        }
    }
}

#Preview {
    MoveToStopText()
}
