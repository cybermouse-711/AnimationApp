//
//  ContentView.swift
//  AnimationApp
//
//  Created by Елизавета Медведева on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimerCounter()
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
                    StarView(frame: 20).padding(.top, 10)
                    Spacer()
                    StarView(frame: 30).padding(.top, 30)
                }
                
                HStack {
                    StarView(frame: 45).padding(.top, 70)
                    Spacer()
                    StarView(frame: 20).padding(.top, 20)
                    Spacer()
                }
                
                if !awardIsShowing {
                    StarView(frame: 80)
                        .padding(.top, 60)
                        .transition(.changePoint)
                }

                Spacer()
                
                ButtonView(
                    text: "\(awardIsShowing ? "Желание загадывается" : "Загадать желание")",
                    action: awardIsShowing ? timer.startTimer : starAnimation
                )
                .opacity(awardIsShowing ? 0.7 : 0.9)
                .scaleEffect(awardIsShowing ? 0.8 : 1)
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
        let animationEnd = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let animationStart = AnyTransition.move(edge: .bottom)
            .combined(with: .opacity)
                    
        return .asymmetric(insertion: animationEnd, removal: animationStart)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
