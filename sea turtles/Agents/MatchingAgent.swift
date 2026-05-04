//
//  MatchingAgent.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import Foundation

// Again, we use 'actor' for independent, safe execution.
actor MatchingAgent: MatchingAgentProtocol {
    
    func findMatch(for features: [Int]) async throws -> TurtleProfile? {
        print("Matching Agent: Received features \(features). Searching database...")
        
        // Simulate database query time
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Look up the pattern in our mock database
        if let matchedTurtle = MockDatabase.knownTurtles[features]{
            print("Matching Agent: Match found! -> \(matchedTurtle.name)")
            return matchedTurtle
        } else {
            print("Matching Agent: No match found.")
            return nil
        }
    }
}
