//
//  ContentView.swift
//  TrafficLight
//
//  Created by Ilya Zemskov on 19.04.2023.
//

import SwiftUI

enum TrafficLight {
    case off, red, yellow, green
}

struct ContentView: View {
    
    private let lightOn = 1.0
    private let lightOff = 0.3
    
    @State private var currentButtonText = "START"
    @State private var currentLight = TrafficLight.off
    
    var body: some View {
        VStack {
            VStack {
                TrafficLightView(
                    color: .red,
                    opacity: currentLight == .red ? lightOn : lightOff)
                TrafficLightView(
                    color: .yellow,
                    opacity: currentLight == .yellow ? lightOn : lightOff)
                TrafficLightView(
                    color: .green,
                    opacity: currentLight == .green ? lightOn : lightOff)
                
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
        case .off: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
