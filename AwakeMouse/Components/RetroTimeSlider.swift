//
//  RetroTimeSlider.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 5.12.2025.
//

import SwiftUI

struct RetroTimeSlider: View {
    @Binding var selection: TimeOption
    
    // Size settings
    private var tickCount: Int { TimeOption.allCases.count }
    private let tickVerticalOffset: CGFloat = 12
    private let tickWidth: CGFloat = 15
    private let tickHeight: CGFloat = 6
    private let spineWidth: CGFloat = 7
    private let safeMargin: CGFloat = 15
    
    // Text settings
    private let textYAdjustment: CGFloat = 3
    private let fontSize: CGFloat = 10
    private let fontName: String = "Minecraftia-Regular"

    // Color settings
    private let spineColor = Color(white: 0.25)
    private let inactiveTickColor = Color(white: 0.7)
    private let activeColor = Color.white
    
    var body: some View {
        GeometryReader { geo in
            let totalHeight = geo.size.height
            
            // Drawable area
            let usableHeight = totalHeight - (safeMargin * 2)
            let stepHeight = usableHeight / CGFloat(tickCount - 1)
            let options = TimeOption.allCases
            
            ZStack(alignment: .leading) {
                
                // Spine
                VStack(spacing: 0) {
                    let blockCount = Int(usableHeight / spineWidth)
                    ForEach(0...blockCount, id: \.self) { _ in
                        PixelShapeSlider(color: spineColor, pixelSize: 2)
                            .frame(width: spineWidth, height: spineWidth)
                    }
                }
                .frame(height: usableHeight, alignment: .top)
                .clipped()
                .offset(x: (tickWidth / 2) - (spineWidth / 2))
                .offset(y: safeMargin)
                
                // Ticks
                ForEach(0..<tickCount, id: \.self) { index in
                    let option = options[index]
                    let isSelected = (selection == option)
                    
                    // Y position
                    let yPosition = safeMargin + (CGFloat(index) * stepHeight) + tickVerticalOffset
                    
                    // Tick
                    PixelShapeSlider(
                        color: isSelected ? activeColor : inactiveTickColor,
                        pixelSize: 2
                    )
                    .frame(width: tickWidth, height: tickHeight)
                    // Text
                    .overlay(alignment: .leading) {
                        if isSelected {
                            Text(option.label)
                                .font(.custom(fontName, size: fontSize))
                                .foregroundColor(activeColor)
                                .fixedSize()
                                .offset(x: option.textXOffset, y: textYAdjustment)
                                .transition(.opacity)
                        }
                    }
                    .position(x: tickWidth / 2, y: yPosition)
                }
            }
            // Interaction
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let relativeY = value.location.y - safeMargin - 3
                        let index = Int(round(relativeY / stepHeight))
                        let clampedIndex = min(max(index, 0), options.count - 1)
                        let newSelection = options[clampedIndex]
                        
                        if selection != newSelection {
                            selection = newSelection
                        }
                    }
            )
        }
        .frame(width: 15)
    }
}

struct PixelShapeSlider: View {
    var color: Color
    var pixelSize: CGFloat = 2
    
    var body: some View {
        ZStack {
            Rectangle().fill(color).padding(.vertical, pixelSize)
            Rectangle().fill(color).padding(.horizontal, pixelSize)
        }
    }
}

// Helper
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content
    init(_ initialValue: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    var body: some View { content($value) }
}

enum TimeOption: CaseIterable {
    case unlimited, thirtyMin, oneHour, threeHours, fiveHours
    
    var label: String {
        switch self {
        case .unlimited: return "Unlimited"
        case .thirtyMin: return "30 min"
        case .oneHour: return "1 h"
        case .threeHours: return "3 h"
        case .fiveHours: return "5 h"
        }
    }
    
    var textXOffset: CGFloat {
        switch self {
        case .unlimited: return -53
        case .thirtyMin: return -37
        case .oneHour: return -20
        case .threeHours: return -20
        case .fiveHours: return -20
        }
    }
    
    var seconds: TimeInterval? {
        switch self {
        case .unlimited: return nil
        case .thirtyMin: return 30 * 60
        case .oneHour: return 60 * 60
        case .threeHours: return 3 * 60 * 60
        case .fiveHours: return 5 * 60 * 60
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        StatefulPreviewWrapper(TimeOption.unlimited) { binding in
            RetroTimeSlider(selection: binding)
        }
    }
    .frame(height: 150)
    .padding(.leading, 80)
}
