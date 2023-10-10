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
    
    var counter = 2
    var timer: Timer?
    
    var awardIsShowing = false
    
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
        objectWillChange.send()
    }
    
    @objc private func updateTimer() {
        
        if counter > 0 {
            counter -= 1
        } else {
            counter = 2
            timer?.invalidate()
            timer = nil
            awardIsShowing.toggle()
        }
        objectWillChange.send()
    }
    
    
}
