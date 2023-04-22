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
    
    var value: Double {
        switch self {
        case .on:
            return 1.0
        case .off:
            return 0.3
        }
    }
}

struct ContentView: View {
    
    @State private var buttonText = "START"
    @State private var currentLight = TrafficLight.red

    @State private var redLight: Color = .red.opacity(Light.off.value)
    @State private var yellowLight: Color = .yellow.opacity(Light.off.value)
    @State private var greenLight: Color = .green.opacity(Light.off.value)
    
    
    var body: some View {
        VStack {
            VStack {
                TrafficLightView(color: redLight)
                TrafficLightView(color: yellowLight)
                TrafficLightView(color: greenLight)
                
                Spacer()
            }
            .padding(.top, 50)
            
            ButtonView(buttonText: buttonText, action: lightButtonTapped)
        }
    }
    
    private func lightButtonTapped() {
        if buttonText == "START" {
            buttonText = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenLight = .green.opacity(Light.off.value)
            redLight = .red.opacity(Light.on.value)
            currentLight = .yellow
        case .yellow:
            redLight = .red.opacity(Light.off.value)
            yellowLight = .yellow.opacity(Light.on.value)
            currentLight = .green
        case .green:
            yellowLight = .yellow.opacity(Light.off.value)
            greenLight = .green.opacity(Light.on.value)
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
