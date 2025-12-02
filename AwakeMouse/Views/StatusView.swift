//
//  StatusView.swift
//  MouseFloater
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
            }
            else {
                IdleView()
            }
            
        }
    }
}


