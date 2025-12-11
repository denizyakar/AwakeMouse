//
//  AwakeDurationText.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 5.12.2025.
//

import SwiftUI

struct AwakeDurationText: View {
    var isRunning: Bool
    var selectedTime: TimeOption
    var timeRemaining: TimeInterval
    
    var body: some View {
        Text(displayText)
            .font(.minecraftia(size: 12))
            .foregroundColor(.white.opacity(0.8))
            .animation(nil, value: timeRemaining)
    }
    
    private var displayText: String {
        if isRunning {
            if selectedTime == .unlimited {
                return "Staying awake indefinitely"
            } else {
                return "Staying awake for \(formatTime(timeRemaining))"
            }
        } else {
            if selectedTime == .unlimited {
                return "Will stay awake indefinitely"
            } else if let seconds = selectedTime.seconds {
                return "Will stay awake for \(formatTime(seconds))"
            }
        }
        return ""
    }
    
    private func formatTime(_ totalSeconds: TimeInterval) -> String {
        let seconds = Int(totalSeconds)
        let h = seconds / 3600
        let m = (seconds % 3600) / 60
        let s = seconds % 60
        
        if h > 0 {
            if isRunning {
                return "\(h)h \(m)m \(s)s"
            } else {
                return "\(h)h \(m)min"
            }
        } else if m > 0 {
            return "\(m)min \(s)s"
        } else {
            return "\(s)s"
        }
    }
}

#Preview {
    ZStack {
        Color.black
        VStack(spacing: 20) {
            AwakeDurationText(isRunning: false, selectedTime: .thirtyMin, timeRemaining: 1800)
            AwakeDurationText(isRunning: true, selectedTime: .thirtyMin, timeRemaining: 150)
            AwakeDurationText(isRunning: true, selectedTime: .unlimited, timeRemaining: 0)
        }
    }
}
