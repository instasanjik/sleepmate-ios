//
//  DailyStatistic.swift
//  Sleepmate
//
//  Created by Sanzhar Koshkarbayev on 23.01.2023.
//

import Foundation

class DailyStatistic {
    
    var date: Date
    var sleepDuration: Double
    var deepSleepDuration: Double
    var wakeUpCount: Int
    var bedTime: Date
    var wakeUpTime: Date
    
    var sleepEfficiency: Double {
        return sleepDuration / (wakeUpTime.timeIntervalSince(bedTime) / 3600)
    }
    
    var fellAsleepTime: Date {
       return wakeUpTime.addingTimeInterval(-sleepDuration)
    }
    
    init(date: Date, sleepDuration: Double, deepSleepDuration: Double, wakeUpCount: Int, bedTime: Date, wakeUpTime: Date) {
        self.date = date
        self.sleepDuration = sleepDuration
        self.deepSleepDuration = deepSleepDuration
        self.wakeUpCount = wakeUpCount
        self.bedTime = bedTime
        self.wakeUpTime = wakeUpTime
    }
    
    
}
