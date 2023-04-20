//
//  ButtonView.swift
//  TrafficLight
//
//  Created by Ilya Zemskov on 20.04.2023.
//

import SwiftUI

struct ButtonView: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .font(.title.bold())
                .foregroundColor(.white)
                .frame(width: 200, height: 80)
        }
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color.white, lineWidth: 4))
        .shadow(radius: 20)
        .padding(.bottom, 50)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "START", action: {  })
    }
}
