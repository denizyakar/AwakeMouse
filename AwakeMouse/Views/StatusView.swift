//
//  StatusView.swift
//  AwakeMouse
//
//  Created by Ali Deniz Yakar on 20.11.2025.
//

import SwiftUI

struct StatusView: View {
    let isRunning: Bool
    
    var body: some View {
        Group {
            if isRunning {
                RunningView()
                    .padding(.trailing)
                    .padding(.leading)
            } else {
                IdleView()
                    .padding(.trailing)
                    .padding(.leading)
            }
        }
    }
}
