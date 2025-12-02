//
//  MouseFloaterApp.swift
//  MouseFloater
//
//  Created by Ali Deniz Yakar on 20.11.2025.
//

import SwiftUI

@main
struct MouseFloaterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fixedSize()
        }
        .windowResizability(.contentSize)
    }
}
