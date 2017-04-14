//
//  ModeOfCounting.swift
//  AnimalID
//
//  Created by Nazar on 13.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation

class ModelOfCounting {
    var time = NSDate()
    
    func timeToStar() -> TimeInterval {
        let timeToStart = Int(time.timeIntervalSince1970) - startTimeFunc()
        return TimeInterval(timeToStart)
    }
    func timeToFinish() -> TimeInterval {
        print(time.timeIntervalSince1970, "=============")
        let timeToFinish = Int(time.timeIntervalSince1970) - endTimeFunc()
        return TimeInterval(timeToFinish)
    }
    
    func isCountingActiv() -> Bool {
        print(Int(time.timeIntervalSince1970))
        let timeToStart = Int(time.timeIntervalSince1970) - startTimeFunc()
        let timeToFinish = Int(time.timeIntervalSince1970) - endTimeFunc()
        if timeToStart > 0 && timeToFinish < 0 {
            return true
        } else { return false }
    }
    
    func startTimeFunc() -> Int {
        if let start = Int(UserDefaults.standard.string(forKey: "startTime") ?? "0") {
            print(start, "Start time")
            return start
        } else { return -1 }
    }
    
    func endTimeFunc() -> Int {
        if let end = Int(UserDefaults.standard.string(forKey: "endTime") ?? "0") {
            print(end, "End time")
            return end
        } else { return -1 }
    }
    
}
