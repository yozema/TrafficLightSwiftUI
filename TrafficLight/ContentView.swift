//
//  ContentView.swift
//  TrafficLight
//
//  Created by Ilya Zemskov on 19.04.2023.
//

import SwiftUI

enum TrafficLight {
    case red, yellow, green
}

enum Light {
    case on
    case off
    
    var state: Double {
        switch self {
        case .on:
            return 1.0
        case .off:
            return 0.3
        }
    }
}

struct ContentView: View {
    
    @State private var currentButtonText = "START"
    @State private var currentLight = TrafficLight.red

    @State private var redLightState = Light.off.state
    @State private var yellowLightState = Light.off.state
    @State private var greenLightState = Light.off.state
    
    var body: some View {
        VStack {
            VStack {
                TrafficLightView(color: .red.opacity(redLightState))
                TrafficLightView(color: .yellow.opacity(yellowLightState))
                TrafficLightView(color: .green.opacity(greenLightState))
                
                Spacer()
            }
            .padding(.top, 50)
            
            ButtonView(buttonText: currentButtonText, action: lightButtonTapped)
        }
    }
    
    private func lightButtonTapped() {
        if currentButtonText == "START" {
            currentButtonText = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenLightState = Light.off.state
            redLightState = Light.on.state
            currentLight = .yellow
        case .yellow:
            redLightState = Light.off.state
            yellowLightState = Light.on.state
            currentLight = .green
        case .green:
            yellowLightState = Light.off.state
            greenLightState = Light.on.state
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
