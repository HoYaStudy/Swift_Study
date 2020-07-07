//
//  TimerData.swift
//  SwiftUIEssential
//
//  Created by hoya kim on 2020/06/15.
//  Copyright © 2020 hoya kim. All rights reserved.
//

import Foundation
import Combine

class TimerData: ObservableObject {
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
