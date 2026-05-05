//
//  MockDatabase.swift
//  sea turtles
//

import Foundation

struct MockDatabase {
    static let knownTurtles: [String: TurtleProfile] = [
        "114-126-134": TurtleProfile(
            name: "gpcm3",
            species: "Chelonia mydas",
            location: "Guadeloupe (Malendure)",
            scutePattern: "114-126-134",
            description: "First match in Guadeloupe, observed multiple times between 2013 and 2015.",
            imageName: "turtle_gpcm3"
        ),
        "315-325-334": TurtleProfile(
            name: "Tomy",
            species: "Eretmochelys imbricata",
            location: "Martinique (Les Anses d'Arlet)",
            scutePattern: "315-325-334",
            description: "A young hawksbill often seen near the seagrass beds.",
            imageName: "turtle_tomy"
        ),
        "216-225-236": TurtleProfile(
            name: "Petite-Terre 01",
            species: "Chelonia mydas",
            location: "Guadeloupe (Petite-Terre)",
            scutePattern: "216-225-236",
            description: "A large green turtle monitored in the natural reserve.",
            imageName: "turtle_pt01"
        ),
        "414-345-334": TurtleProfile(
            name: "Cara",
            species: "Caretta caretta",
            location: "Caribbean Sea",
            scutePattern: "414-345-334",
            description: "A loggerhead turtle with a distinct brown-red shell.",
            imageName: "turtle_cara"
        ),
        "126-135-146": TurtleProfile(
            name: "Maly",
            species: "Chelonia mydas",
            location: "Guadeloupe (Baie de Malendure)",
            scutePattern: "126-135-146",
            description: "Frequently spotted feeding on seagrass at shallow depths.",
            imageName: "turtle_maly"
        ),
        "215-225-237": TurtleProfile(
            name: "Hawky",
            species: "Eretmochelys imbricata",
            location: "Martinique (Diamond Rock)",
            scutePattern: "215-225-237",
            description: "Recognizable by the sharp curve of its beak.",
            imageName: "turtle_hawky"
        ),
        "114-126-135": TurtleProfile(
            name: "Greenie",
            species: "Chelonia mydas",
            location: "Guadeloupe (Petit-Canal)",
            scutePattern: "114-126-135",
            description: "A medium-sized green turtle often found near mangroves.",
            imageName: "turtle_greenie"
        ),
        "325-335-346": TurtleProfile(
            name: "Shellby",
            species: "Eretmochelys imbricata",
            location: "Martinique (Sainte-Anne)",
            scutePattern: "325-335-346",
            description: "A beautifully colored hawksbill with very symmetrical scutes.",
            imageName: "turtle_shellby"
        ),
        "145-215-225": TurtleProfile(
            name: "Flipper",
            species: "Chelonia mydas",
            location: "Guadeloupe (Goyave)",
            scutePattern: "145-215-225",
            description: "Named for its unusually long front flippers.",
            imageName: "turtle_flipper"
        ),
        "4-post-ocular": TurtleProfile(
            name: "Loggie",
            species: "Caretta caretta",
            location: "Caribbean Sea",
            scutePattern: "4-post-ocular",
            description: "A large loggerhead turtle often seen in deep open waters.",
            imageName: "turtle_loggie"
        )
    ]
}
