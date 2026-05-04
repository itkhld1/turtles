//
//  VisionAgent.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import Foundation
import UIKit

// we use actor, not struct or class
// it confirms to our VisionAgentProtocol

actor VisionAgent: VisionAgentProtocol {
    
    func extractFeatures(from image: UIImage) async throws -> [Int] {
        print("Agent: image received. Starting analysis... ")
        
        // Simulate the time it takes for a complex Vision framework to process an image
        // 1.5 seconds delay
        
        try await Task.sleep(nanoseconds: 1_500_000_000)
        
        print("Agent: Analysis complete. Found 3 scales on left, 4 on right.")
        
        // in a real scenario, this is where Apple's Vision framework would output real numbers.
        // for our test, we will hardcode the return of Turtles 1's scale pattern: [3, 4]
        return [3, 4]
        
    }
}
