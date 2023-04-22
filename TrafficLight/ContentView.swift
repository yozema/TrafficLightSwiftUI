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
    
    var opacity: Double {
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

    @State private var redLightState = Light.off.opacity
    @State private var yellowLightState = Light.off.opacity
    @State private var greenLightState = Light.off.opacity
    
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
            greenLightState = Light.off.opacity
            redLightState = Light.on.opacity
            currentLight = .yellow
        case .yellow:
            redLightState = Light.off.opacity
            yellowLightState = Light.on.opacity
            currentLight = .green
        case .green:
            yellowLightState = Light.off.opacity
            greenLightState = Light.on.opacity
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
