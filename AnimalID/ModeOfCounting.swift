//
//  ModeOfCounting.swift
//  AnimalID
//
//  Created by Nazar on 13.04.17.
//  Copyright © 2017 Nazar. All rights reserved.
//

import Foundation
import CoreLocation

class ModelOfCounting {
    

  
    
    func timeToStar() -> TimeInterval {
        let time = NSDate()
        let timeToStart = Int(time.timeIntervalSince1970) - startTimeFunc()
        return TimeInterval(timeToStart)
    }
    
    func timeToFinish() -> TimeInterval {
        let time = NSDate()
        print(time.timeIntervalSince1970, "=============")
        let timeToFinish = Int(time.timeIntervalSince1970) - endTimeFunc()
        return TimeInterval(timeToFinish)
    }
    
    func isCountingActiv() -> Bool {
        let time = NSDate()
        let timeNow = Int(time.timeIntervalSince1970)
        print(Int(time.timeIntervalSince1970))
        let timeStart = startTimeFunc()
        let timeFinish = endTimeFunc()
        if timeStart < timeNow && timeFinish > timeNow {
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
