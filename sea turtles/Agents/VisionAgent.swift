//
//  VisionAgent.swift
//  sea turtles
//

import Foundation
import UIKit

actor VisionAgent: VisionAgentProtocol {
    
    func extractFeatures(from image: UIImage) async throws -> String {
        print("Agent: image received. Starting facial scute analysis...")
        
        // Simulate processing time
        try await Task.sleep(nanoseconds: 1_500_000_000)
        
        // For your demonstration, I will create a mapping that simulates 
        // a successful scan of the unique patterns.
        
        let confidenceScore = simulateConfidence(for: image)
        
        if confidenceScore < 0.6 {
            return "UNKNOWN"
        }

        
        let allPatterns = Array(MockDatabase.knownTurtles.keys).sorted()
        
        // This logic ensures that different images produce different results from your 10 turtles
        let imageSeed = Int(image.size.width + image.size.height) % allPatterns.count
        let detectedPattern = allPatterns[imageSeed]
        
        print("Agent: Analysis complete. Detected Pattern: \(detectedPattern)")
        return detectedPattern
    }
    
    private func simulateConfidence(for image: UIImage) -> Double {
        let width = image.size.width
        let height = image.size.height
        
        // If it's a real photo (not a tiny icon), we have high confidence
        if width > 500 || height > 500 {
            return 0.9
        }
        return 0.2
    }
}
