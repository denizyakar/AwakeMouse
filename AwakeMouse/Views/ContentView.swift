//
//  ContentView.swift
//  MouseFloater
//
//  Created by Ali Deniz Yakar on 20.11.2025.
//

import SwiftUI
import AppKit

struct ContentView: View {
    
    @State private var timer: Timer? = nil
    @State private var step = 0
    @State private var lastWarpedPoint: CGPoint? = nil
    @State private var isRunning: Bool = false
    
    private let stepLeftRightPixel: CGFloat = 15
    private let stepUpDownPixel: CGFloat = 15
    
    var body: some View {
        
            VStack {
                StatusView(isRunning: isRunning)
                Text("Click On to Start")
                    .font(Font.custom("Minecraftia-Regular",size:15))
                    .padding(.top)
                Text("Move Mouse to Stop")
                    .font(Font.custom("Minecraftia-Regular",size:15))
                Button("On") {
                    onButtonClick()
                }
            }
            .padding()
            .background(
                GeometryReader { geo in
                    Color.clear
                    
                        .onAppear{
                            print("size:\(geo.size)")
                        }
                        .onChange(of: geo.size) { newSize in
                                                print("📏 BOYUT DEĞİŞTİ: \(newSize)")
                                            }
                } )
}
    private func onButtonClick() {
        print("On Button Clicked")
        lastWarpedPoint = nil
        startTimer(intervalSeconds: 0.01)
    }
    
    //Mouse move function
    private func moveMouseBy(dx: CGFloat, dy: CGFloat) {
        let thresholdLR: CGFloat = 12
        let thresholdUD : CGFloat = 12
        let current = NSEvent.mouseLocation
        
        if let last = lastWarpedPoint {
            let xChange = current.x - last.x
            let yChange = current.y - last.y
            if abs(xChange) > thresholdLR || abs(yChange) > thresholdUD {
                print("user interaction detected")
                print("timer invalidated")
                isRunning = false
                timer?.invalidate()
                timer = nil
                return
            }
        }
        // 2) Hedefi AppKit koordinatında hesapla
           let targetAppKit = CGPoint(x: current.x + dx,
                                      y: current.y + dy)
           
           // 3) Quartz koordinatına çevir (0,0 sol-üst)
           var targetQuartz = targetAppKit
           if let h = NSScreen.main?.frame.height {
               targetQuartz.y = h - targetAppKit.y
           }
        
        // 4) MouseMoved CGEvent oluştur ve sisteme gönder
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
    
    //Timers
    
    private func startTimer(intervalSeconds: TimeInterval) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: intervalSeconds, repeats: true) { _ in
            
            isRunning = true
           
            if step == 0 {
                self.moveMouseBy(dx: -stepLeftRightPixel, dy: 0)
                step = (step + 1) % 4
            }
            else if step == 1 {
                self.moveMouseBy(dx: 0, dy: stepUpDownPixel)
                step = (step + 1) % 4
            }
            else if step == 2 {
                self.moveMouseBy(dx: stepLeftRightPixel, dy: 0)
                step = (step + 1) % 4
            }
            else if step == 3 {
                self.moveMouseBy(dx: 0, dy: -stepUpDownPixel)
                step = (step + 1) % 4
            }
            
        }
    }
    
}

#Preview {
    ContentView()
}
