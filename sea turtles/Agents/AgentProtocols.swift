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
    /// takes a photo of a turrle from the photos and return an array of intergers representing the scale counts
    func extractFeatures(from image: UIImage) async throws -> [Int]
}

// MARK: - matching agent interface
protocol MatchingAgentProtocol {
    /// takes the extracted scale counts and search in database for a matching turtles
    func findMatch(for features: [Int]) async throws -> TurtleProfile?
}


