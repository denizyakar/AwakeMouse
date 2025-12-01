//
//  RunningView.swift
//  MouseFloater
//
//  Created by Ali Deniz Yakar on 27.11.2025.
//

import SwiftUI

struct RunningView: View {
    
    @State private var hue: Double = 0
    
    var body: some View {
        VStack{
            Text("Awake Mouse")
                .font(.largeTitle)
                .bold()
            Text("IS RUNNING")
                .font(.title2)
                .bold()
        }
        .foregroundColor(.red)
        .hueRotation(.degrees(hue))
        .animation(
            .linear(duration: 3).repeatForever(autoreverses: false),
            value: hue)

        .onAppear {
            hue = 360
                }
    }
}

#Preview {
    RunningView()
}
