//
//  ContentView.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    let visionAgent: any VisionAgentProtocol
    let matchingAgent: any MatchingAgentProtocol
    
    @State private var statusText: String = "Select a turtle photo from your library to identify it"
    @State private var identifiedTurtle: TurtleProfile? = nil
    @State private var isProcessing: Bool = false
    
    // Photo selection state
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Image display area
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.secondary.opacity(0.1))
                        .frame(height: 300)
                    
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(20)
                    } else {
                        VStack {
                            Image(systemName: "tortoise.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.green)
                            Text("No Image Selected")
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    if isProcessing {
                        ProgressView("Analyzing Scutes...")
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                Text(statusText)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .foregroundColor(identifiedTurtle == nil && !isProcessing && selectedImage != nil ? .red : .primary)
                
                if let turtle = identifiedTurtle {
                    TurtleResultView(turtle: turtle)
                }
                
                Spacer()
                
                // Action Buttons
                VStack(spacing: 12) {
                    PhotosPicker(selection: $selectedItem, matching: .images) {
                        Label("Pick from Photos", systemImage: "photo.on.rectangle")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let image = UIImage(data: data) {
                                selectedImage = image
                                await identifyTurtle(image: image)
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
            }
            .navigationTitle("Sea Turtle ID")
        }
    }
    
    private func identifyTurtle(image: UIImage) async {
        isProcessing = true
        identifiedTurtle = nil
        statusText = "Analyzing facial scute pattern..."
        
        do {
            let pattern = try await visionAgent.extractFeatures(from: image)
            
            // Check if it's a "no turtle" result from our mock agent
            if pattern == "UNKNOWN" {
                statusText = "The Vision Agent could not find a turtle in this photo."
            } else {
                statusText = "Searching database for pattern \(pattern)..."
                let match = try await matchingAgent.findMatch(for: pattern)
                
                if let match = match {
                    identifiedTurtle = match
                    statusText = "Match found!"
                } else {
                    statusText = "No match found for this pattern (\(pattern))."
                }
            }
        } catch {
            statusText = "Error: \(error.localizedDescription)"
        }
        
        isProcessing = false
    }
}

struct TurtleResultView: View {
    let turtle: TurtleProfile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let imageName = turtle.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Identity Confirmed")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.blue)
                
                Text(turtle.name)
                    .font(.title2)
                    .bold()
                
                HStack {
                    Text(turtle.species)
                        .font(.subheadline)
                        .italic()
                    Spacer()
                    Text(turtle.location)
                        .font(.caption)
                        .padding(4)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(4)
                }
                
                Text(turtle.description ?? "")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.blue.opacity(0.05))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView(visionAgent: VisionAgent(), matchingAgent: MatchingAgent())
}
