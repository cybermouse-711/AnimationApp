//
//  StarView.swift
//  AnimationApp
//
//  Created by Елизавета Медведева on 05.10.2023.
//

import SwiftUI

struct StarView: View {
    
    let color: Color
    let round: Double
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let nearLine = size * 0.333
            let farLine = size * 0.666
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: nearLine, y: middle))
                path.addLine(to: CGPoint(x: 0, y: height))
                path.addLine(to: CGPoint(x: middle, y: farLine))
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: farLine, y: middle))
                path.addLine(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: middle, y: nearLine))
            }
            .fill(color)
            .opacity(0.5)
            .rotationEffect(.degrees(round))
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(color: .gray, round: 60)
            .frame(width: 200, height: 200)
    }
}
