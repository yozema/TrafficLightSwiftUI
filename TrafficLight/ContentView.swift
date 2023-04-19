//
//  ContentView.swift
//  TrafficLight
//
//  Created by Ilya Zemskov on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TrafficLightView(color: .red)
                .padding(.bottom, 10)
            TrafficLightView(color: .yellow)
                .padding(.bottom, 10)
            TrafficLightView(color: .green)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
