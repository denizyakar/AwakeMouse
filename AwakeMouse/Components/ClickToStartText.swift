//
//  HowToStartText.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 3.12.2025.
//

import SwiftUI

struct HowToStartText: View {
    @State var textAnimating: Bool = false
    
    var fontName = "Minecraftia-Regular"
    
    var body: some View {
        VStack {
            Text("Click On to Start")
                .font(Font.custom(fontName,size:15))
                .opacity(textAnimating ? 0.9 : 0.02)
            VStack(spacing: -20){
                Text("I")
                    .font(Font.custom(fontName,size:15))
                    .opacity(textAnimating ? 0.9 : 0.02)
                Text("v")
                    .font(Font.custom(fontName,size:17))
                    .opacity(textAnimating ? 0.9 : 0.02)
            }
        }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                    textAnimating.toggle()
                }
            }
    }
}

#Preview {
    HowToStartText()
}
