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

    @State private var redLight: Color = .red.opacity(Light.off.opacity)
    @State private var yellowLight: Color = .yellow.opacity(Light.off.opacity)
    @State private var greenLight: Color = .green.opacity(Light.off.opacity)
    
    var body: some View {
        VStack {
            VStack {
                TrafficLightView(color: redLight)
                TrafficLightView(color: yellowLight)
                TrafficLightView(color: greenLight)
                
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
            greenLight = .green.opacity(Light.off.opacity)
            redLight = .red.opacity(Light.on.opacity)
            currentLight = .yellow
        case .yellow:
            redLight = .red.opacity(Light.off.opacity)
            yellowLight = .yellow.opacity(Light.on.opacity)
            currentLight = .green
        case .green:
            yellowLight = .yellow.opacity(Light.off.opacity)
            greenLight = .green.opacity(Light.on.opacity)
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
