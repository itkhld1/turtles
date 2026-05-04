//
//  sea_turtlesApp.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import SwiftUI

@main
struct sea_turtlesApp: App {
    // Create the instances of our agents here at the top level
    let mainVisionAgent = VisionAgent()
    let mainMatchingAgent = MatchingAgent()
    
    var body: some Scene {
        WindowGroup {
            ContentView(visionAgent: VisionAgent(), matchingAgent: MatchingAgent())
        }
    }
}
