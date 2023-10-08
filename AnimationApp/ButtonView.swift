//
//  ButtonView.swift
//  AnimationApp
//
//  Created by Елизавета Медведева on 08.10.2023.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var awardIsShowing: Bool
    
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
        .opacity(0.8)
        .cornerRadius(20)
        .scaleEffect(awardIsShowing ? 1.5 : 1)
    }
    
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(awardIsShowing: .constant(false), text: "Button", action: {})
    }
}
