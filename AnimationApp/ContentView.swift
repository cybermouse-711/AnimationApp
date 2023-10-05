//
//  ContentView.swift
//  AnimationApp
//
//  Created by Елизавета Медведева on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
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
                
                StarView(frame: 80)
                    .padding(.top, 40)
                
                Spacer()
                
                Button(action: {}) {
                    Text("Загадать желание")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
