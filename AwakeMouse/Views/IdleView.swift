//
//  IdleView.swift
//  MouseFloater
//
//  Created by Ali Deniz Yakar on 27.11.2025.
//

import SwiftUI

struct IdleView: View {
    var body: some View {
        Text("Awake Mouse")
            .font(Font.custom("Minecraftia-Regular",size:25))
            
        Text("IS NOT RUNNING")
            .font(Font.custom("Minecraftia-Regular",size:20))
            .opacity(0.7)
    }
}

#Preview {
    
    IdleView()
}
