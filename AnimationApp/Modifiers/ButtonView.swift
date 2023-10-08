//
//  ButtonView.swift
//  AnimationApp
//
//  Created by Елизавета Медведева on 08.10.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(text)
                .bold()
                .foregroundColor(.blue)
        }
        .frame(width: 250, height: 50)
        .background(.white)
        .opacity(0.9)
        .cornerRadius(20)
    }
    
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Button", action: {})
    }
}
