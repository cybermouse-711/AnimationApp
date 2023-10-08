//
//  TimerCounter.swift
//  AnimationApp
//
//  Created by Елизавета Медведева on 08.10.2023.
//

import Combine
import Foundation

class TimerCounter: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var counter = 3
    var timer: Timer?
    
    @ObservedObject var awardIsShowing = true
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true
            )
        }
        stopAnimation()
    }
    
    private func stopAnimation() {
            awardIsShowing.toggle()
    }
    
    @objc private func updateTimer() {
        
        if counter > 0 {
            counter -= 1
        } else {
            timer?.invalidate()
            timer = nil
        }
        
        objectWillChange.send()
    }
    
        
}
