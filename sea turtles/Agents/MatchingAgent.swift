//
//  MatchingAgent.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import Foundation

actor MatchingAgent: MatchingAgentProtocol {
    
    func findMatch(for pattern: String) async throws -> TurtleProfile? {
        // If the Vision Agent already failed to find a turtle
        if pattern == "UNKNOWN" {
            return nil
        }
        
        print("Matching Agent: Searching TORSOOI for pattern \(pattern)...")
        
        // Simulate database query time
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Look up the pattern in our mock database
        if let matchedTurtle = MockDatabase.knownTurtles[pattern] {
            print("Matching Agent: Match found! -> \(matchedTurtle.name)")
            return matchedTurtle
        } else {
            print("Matching Agent: Pattern \(pattern) not recognized in current database.")
            return nil
        }
    }
}
