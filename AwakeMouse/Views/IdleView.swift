//
//  IdleView.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 27.11.2025.
//

import SwiftUI

struct IdleView: View {
    private let fontName: String = "Minecraftia-Regular"
    private let mainFontSize: CGFloat = 20

    var body: some View {
        VStack {
            Text("Awake Mouse")
                .font(.custom(fontName, size: 25))

            Text("IS NOT RUNNING")
                .font(.custom(fontName, size: mainFontSize))
                .opacity(0.7)
                .overlay(alignment: .topTrailing) {
                    ZzzAnimationView(
                        color: .green.opacity(0.7),
                        fontSize: 12
                    )
                    .offset(
                        x: mainFontSize * 1.4,
                        y: -mainFontSize * 0.5
                    )
                    .rotationEffect(.degrees(-30))
                }
        }
    }
}

#Preview {
    IdleView()
}
