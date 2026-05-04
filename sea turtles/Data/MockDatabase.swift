//
//  MockDatabase.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import Foundation

struct MockDatabase {
    // i am using the scale count as "key" to find the turtle
    // [3, 4] means 3 scales on left and 4 scales on right
    static let knownTurtles: [[Int]: TurtleProfile] = [
        [1,10]: TurtleProfile(name: "Turtle 1", species: "Species 1", description: "description 1"),
        [2,9]: TurtleProfile(name: "Turtle 2", species: "Species 2", description: "description 2"),
        [3,4]: TurtleProfile(name: "Turtle 3", species: "Species 3", description: "description 3"),
        [4,7]: TurtleProfile(name: "Turtle 4", species: "Species 4", description: "description 4"),
        [5,6]: TurtleProfile(name: "Turtle 5", species: "Species 5", description: "description 5"),
        [6,5]: TurtleProfile(name: "Turtle 6", species: "Species 6", description: "description 6"),
        [7,4]: TurtleProfile(name: "Turtle 7", species: "Species 7", description: "description 7"),
        [8,3]: TurtleProfile(name: "Turtle 8", species: "Species 8", description: "description 8"),
        [9,2]: TurtleProfile(name: "Turtle 9", species: "Species 9", description: "description 9"),
        [10,1]: TurtleProfile(name: "Turtle 10", species: "Species 10", description: "description 10")
    ]
}
