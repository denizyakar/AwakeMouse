//
//  ContentView.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 20.11.2025.
//

import SwiftUI
import AppKit

struct ContentView: View {
    @State private var engine = AwakeMouseEngine()
    
    var body: some View {
        ZStack {
            RetroBackground()
            
            HStack {
                VStack {
                    StatusView(isRunning: engine.isRunning)
                    
                    if engine.isRunning {
                        MoveToStopText()
                    } else {
                        ClickToStartText()
                    }
                    
                    AwakeDurationText(
                        isRunning: engine.isRunning,
                        selectedTime: engine.selectedTime,
                        timeRemaining: engine.timeRemaining
                    )
                    
                    ZStack {
                        RetroPowerSwitch(isOn: Binding(
                            get: { engine.isRunning },
                            set: { newValue in
                                if newValue {
                                    engine.onButtonClick()
                                }
                            }
                        ))
                        
                        HStack {
                            VStack {
                                Link(destination: URL(string: "https://github.com/denizyakar")!) {
                                    Image("githubLogoPix1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 32, height: 32)
                                }
                                
                                Text("GitHub")
                                    .font(.minecraftia(size: 8))
                            }
                            
                            Spacer()
                            
                            RetroTimeSlider(selection: $engine.selectedTime)
                                .frame(height: 120)
                                .offset(y: -20)
                        }
                    }
                }
            }
            .padding()
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear {
                            print("size:\(geo.size)")
                        }
                        .onChange(of: geo.size) { newSize in
                            print("Screen size changed: \(newSize)")
                        }
                }
            )
        }
    }
}

#Preview {
    ContentView()
        .frame(width: 255, height: 316.5)
}
