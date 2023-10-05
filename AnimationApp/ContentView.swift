//
//  ContentView.swift
//  AnimationApp
//
//  Created by Елизавета Медведева on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var awardIsShowing = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors:[.black, .blue]),
                startPoint: UnitPoint(x: 0, y: 0),
                endPoint: UnitPoint(x: 1, y: 1)
            )
            .ignoresSafeArea()
   
            VStack {
                HStack {
                    Spacer()
                    StarView(frame: 20)
                        .padding(.top, 10)
                    Spacer()
                    StarView(frame: 30)
                        .padding(.top, 30)
                    Spacer()
                }
                HStack {
                    StarView(frame: 45)
                        .padding(.top, 70)
                    Spacer()
                    StarView(frame: 20)
                        .padding(.top, 10)
                    Spacer()
                }
                
                if awardIsShowing {
                    StarView(frame: 80)
                        .padding(.top, 60)
                        .transition(.changePoint)
                }

                Spacer()
                
                Button(action: starAnimation) {
                    Text(awardIsShowing ? "Желание загадывается" : "Загадать желание")
                        .bold()
                        .foregroundColor(.blue)
                }
                .frame(width: 250, height: 50)
                .background(.white)
                .opacity(0.8)
                .cornerRadius(20)
            }
            .padding()
        }
    }
    
    private func starAnimation() {
        withAnimation{
            awardIsShowing.toggle()
        }
    }
}

extension AnyTransition {
    static var changePoint: AnyTransition {
        let animation1 = AnyTransition.move(edge: .leading)
        
        let animation2 = AnyTransition.move(edge: .bottom)
        
        return .asymmetric(insertion: animation1, removal: animation2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
