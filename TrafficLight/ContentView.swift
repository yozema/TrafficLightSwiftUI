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

    @State private var red: Color = .red.opacity(Light.off.opacity)
    @State private var yellow: Color = .yellow.opacity(Light.off.opacity)
    @State private var green: Color = .green.opacity(Light.off.opacity)
    
    var body: some View {
        VStack {
            VStack {
                TrafficLightView(color: red)
                TrafficLightView(color: yellow)
                TrafficLightView(color: green)
                
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
            green = .green.opacity(Light.off.opacity)
            red = .red.opacity(Light.on.opacity)
            currentLight = .yellow
        case .yellow:
            red = .red.opacity(Light.off.opacity)
            yellow = .yellow.opacity(Light.on.opacity)
            currentLight = .green
        case .green:
            yellow = .yellow.opacity(Light.off.opacity)
            green = .green.opacity(Light.on.opacity)
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
