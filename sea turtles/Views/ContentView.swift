//
//  ContentView.swift
//  sea turtles
//
//  Created by itkhld on 4.05.2026.
//

import SwiftUI

struct ContentView: View {
    // DEPENDENCY INJECTION:
    // notice we are using 'any VisionAgentProtocol'. The View doesn't care
    // if this is a mock agent or a real AI, as long as it follows the rules of the protocol.
    let visionAgent: any VisionAgentProtocol
    let matchingAgent: any MatchingAgentProtocol
    
    // state variables to update the UI
    @State private var statusText: String = "Upload a photo to ask 'Kim bu?'"
    @State private var identifiedTurtle: TurtleProfile? = nil
    @State private var isProcessing: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            // placeholder for turtle image
            Image(systemName: "tortoise.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.green)
                .opacity(isProcessing ? 0.5 : 1.0)
            
            Text(statusText)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // if we found a turtle, dispay it's details
            if let turtle = identifiedTurtle {
                VStack(spacing: 8) {
                    Text("Kim Bu? Bu \(turtle.name)!")
                        .font(.title)
                        .bold()
                        .foregroundColor(.blue)
                    
                    Text(turtle.species)
                        .italic()
                    Text(turtle.description ?? "")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(12)
            }
            
            // trigger button
            Button {
                Task {
                    await identifiedTurtle()
                }
            } label: {
                Text(isProcessing ? "Analyzing..." : "Identify Turtle")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isProcessing ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(isProcessing)
            .padding(.horizontal, 40)
        }
        .padding()
    }
    
    // MARK: - Agent Coordination Logic
    private func identifiedTurtle() async {
        isProcessing = true
        identifiedTurtle = nil
        
        do {
            // 1. Create a dummy image (In a real app, you'd let the user pick from their camera roll)
            let dummyImage = UIImage(systemName: "tortoise")!
            
            statusText = "Vision Agent is counting scales..."
            
            // 2. The Vision Agent does its job
            let extractedFeatures = try await visionAgent.extractFeatures(from: dummyImage)
            
            statusText = "Matching Agent is searching TORSOOI database..."
            // 3. The Matching Agent does its job
            let match = try await matchingAgent.findMatch(for: extractedFeatures)
            
            // 4. Update the UI with the final result
            if let match = match {
                identifiedTurtle = match
                statusText = "Match found!"
            } else {
                statusText = "No known turtle matches this pattern."
            }
            
        } catch {
            statusText = "An error occurred during identification."
        }
        
        isProcessing = false
    }
}

// MARK: - Preview Setup
#Preview {
    // Inject our mock agents so the Xcode preview canvas works
    ContentView(visionAgent: VisionAgent(), matchingAgent: MatchingAgent())
}
