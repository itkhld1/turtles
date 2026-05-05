//
//  AgentProtocols.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import Foundation
import UIKit // i import uikit because i will use uiimage to enter an image from the photos to agent

// MARK: - vision agent interface
protocol VisionAgentProtocol {
    /// takes a photo of a turtle from the photos and return a string representing the scute pattern
    func extractFeatures(from image: UIImage) async throws -> String
}

// MARK: - matching agent interface
protocol MatchingAgentProtocol {
    /// takes the extracted scute pattern and search in database for a matching turtles
    func findMatch(for pattern: String) async throws -> TurtleProfile?
}


