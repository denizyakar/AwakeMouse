//
//  AwakeMouseEngine.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 20.11.2025.
//

import SwiftUI
import AppKit

@Observable
class AwakeMouseEngine {
    
    // UI State Variables
    var selectedTime: TimeOption = .unlimited
    var timeRemaining: TimeInterval = 0
    var isRunning: Bool = false
    
    // Internal Logic Variables
    @ObservationIgnored var durationTimer: Timer? = nil
    @ObservationIgnored var timer: Timer? = nil
    
    private var step = 0
    private var lastWarpedPoint: CGPoint? = nil
    
    // Configuration
    private let stepLeftRightPixel: CGFloat = 25
    private let stepUpDownPixel: CGFloat = 25
    
    func onButtonClick() {
        print("On Button Clicked")
        lastWarpedPoint = nil
        startTimer(intervalSeconds: 0.01)
    }
    
    func stopApp() {
        isRunning = false
        
        timer?.invalidate()
        timer = nil
        
        durationTimer?.invalidate()
        durationTimer = nil
    }
    
    private func startTimer(intervalSeconds: TimeInterval) {
        stopApp()
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: intervalSeconds, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.isRunning = true
            
            if self.step == 0 {
                self.moveMouseBy(dx: -self.stepLeftRightPixel, dy: 0)
                self.step = (self.step + 1) % 4
            } else if self.step == 1 {
                self.moveMouseBy(dx: 0, dy: self.stepUpDownPixel)
                self.step = (self.step + 1) % 4
            } else if self.step == 2 {
                self.moveMouseBy(dx: self.stepLeftRightPixel, dy: 0)
                self.step = (self.step + 1) % 4
            } else if self.step == 3 {
                self.moveMouseBy(dx: 0, dy: -self.stepUpDownPixel)
                self.step = (self.step + 1) % 4
            }
        }
        
        if let duration = selectedTime.seconds {
            timeRemaining = duration
            
            durationTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    print("Time is up! app is stopping.")
                    self.stopApp()
                }
            }
        }
    }
    
    private func moveMouseBy(dx: CGFloat, dy: CGFloat) {
        let thresholdLR: CGFloat = 12
        let thresholdUD: CGFloat = 12
        let current = NSEvent.mouseLocation
        
        // Check for User Movement
        if let last = lastWarpedPoint {
            let xChange = current.x - last.x
            let yChange = current.y - last.y
            
            if abs(xChange) > thresholdLR || abs(yChange) > thresholdUD {
                print("User moved mouse (Delta: \(xChange), \(yChange)). Stopping.")
                
                isRunning = false
                timer?.invalidate()
                timer = nil
                return
            }
        }
        
        // Calculate New Target (AppKit Coordinates - Bottom Left 0,0)
        let targetAppKit = CGPoint(
            x: current.x + dx,
            y: current.y + dy
        )
        
        // Convert to Quartz Coordinates (Top Left 0,0)
        var targetQuartz = targetAppKit
        if let primaryScreenHeight = NSScreen.screens.first?.frame.height {
            targetQuartz.y = primaryScreenHeight - targetAppKit.y
        }
        
        if let event = CGEvent(
            mouseEventSource: nil,
            mouseType: .mouseMoved,
            mouseCursorPosition: targetQuartz,
            mouseButton: .left
        ) {
            event.post(tap: .cghidEventTap)
        }
        
        lastWarpedPoint = CGPoint(x: current.x + dx, y: current.y + dy)
    }
}
