//
//  HowToStartText.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 3.12.2025.
//

import SwiftUI

struct ClickToStartText: View {
    @State private var textAnimating: Bool = false
    
    private let fontName = "Minecraftia-Regular"
    
    var body: some View {
        VStack {
            Text("Click On to Start!")
                .font(Font.custom(fontName, size: 15))
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
    ClickToStartText()
}
