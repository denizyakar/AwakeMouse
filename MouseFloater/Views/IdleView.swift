//
//  IdleView.swift
//  MouseFloater
//
//  Created by Ali Deniz Yakar on 27.11.2025.
//

import SwiftUI

struct IdleView: View {
    var body: some View {
        Text("Mouse Floater")
            .font(.largeTitle)
            .bold()
        Text("IS NOT RUNNING")
            .font(.title2)
            .bold()
            .opacity(0.7)
    }
}

#Preview {
    IdleView()
}
