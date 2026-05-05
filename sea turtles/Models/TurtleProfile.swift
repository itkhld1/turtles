//
//  TurtleProfile.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import Foundation

// we make the struct identifiable so swiftui can easly disply in list if needed later.
// we use codable so it easy save and load json in database
struct TurtleProfile: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var species: String
    var location: String
    var scutePattern: String
    var description: String?
    var imageName: String?
}
