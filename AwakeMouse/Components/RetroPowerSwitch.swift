//
//  RetroPowerSwitch.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 2.12.2025.
//

import SwiftUI

struct RetroPowerSwitch: View {
    @Binding var isOn: Bool
    
    var width: CGFloat = 50
    var height: CGFloat = 80
    var depth: CGFloat = 6
    
    private let cornerStep: CGFloat = 4
    
    var body: some View {
        VStack(spacing: 4) {
            
            // On button
            ZStack(alignment: .bottom) {
                // Under layer 
                PixelShape(
                    color: Color(red: 0.2, green: 0.35, blue: 0.4).opacity(0.8),
                    pixelSize: cornerStep
                )
                
                // Surface 
                PixelShape(
                    color: Color(red: 0.1, green: 0.5, blue: 0.4).opacity(1),
                    pixelSize: cornerStep
                )
                .padding(.bottom, isOn ? 0 : depth)
                
                // Text
                Text("ON")
                    .font(.minecraftia(size: 14))
                    .foregroundColor(.white)
                    .offset(y: isOn ? 2 : -2)
            }
            .frame(width: width, height: height / 2)
            .onTapGesture {
                if !isOn {
                    withAnimation(.linear(duration: 0.1)) {
                        isOn = true
                    }
                }
            }
            
            // Off button
            ZStack(alignment: .bottom) {
                // Under layer
                PixelShape(
                    color: Color(red: 0.4, green: 0.1, blue: 0.1).opacity(0.8),
                    pixelSize: cornerStep
                )
                
                // Surface
                PixelShape(
                    color: Color(red: 0.7, green: 0.4, blue: 0.4).opacity(0.6),
                    pixelSize: cornerStep
                )
                .padding(.bottom, isOn ? depth : 0)
                
                // Text
                Text("OFF")
                    .font(.minecraftia(size: 14))
                    .foregroundColor(.white.opacity(0.9))
                    .offset(y: isOn ? -2 : 2)
            }
            .frame(width: width, height: height / 2)
        }
        // Parent frame
        .frame(width: width, height: height + 4)
    }
}

struct PixelShape: View {
    var color: Color
    var pixelSize: CGFloat = 4
    
    var body: some View {
        ZStack {
            // Horizontal part
            Rectangle()
                .fill(color)
                .padding(.vertical, pixelSize) // crop up down
            
            // Vertical part
            Rectangle()
                .fill(color)
                .padding(.horizontal, pixelSize) // crop right left
        }
    }
}

#Preview {
    ZStack {
        Color.black
        RetroPowerSwitch(isOn: .constant(false))
    }
    .frame(width: 200, height: 200)
}
