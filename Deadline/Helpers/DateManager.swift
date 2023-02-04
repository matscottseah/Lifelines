//
//  DateManager.swift
//  Deadline
//
//  Created by Matthew Seah on 1/25/23.
//

import Foundation

struct DateManager {
    static var dayOfYear: Int {
        return Calendar.current.ordinality(of: .day, in: .year, for: Date())!
    }
    
    static var percentOfYearComplete: Int {
        return Int((Float(dayOfYear)/Float(365) * 100))
    }
    
    static var dayOfMonth: Int {
        return Calendar.current.ordinality(of: .day, in: .month, for: Date())!
    }
    
    static var percentOfMonthComplete: Int {
        return Int((Float(dayOfMonth)/Float(daysInMonth) * 100))
    }
    
    static var dayOfWeek: Int {
        let dateComponents = Calendar.current.dateComponents([.weekday], from: Date())
        return dateComponents.weekday!
    }
    
    static var percentOfWeekComplete: Int {
        return Int((Float(dayOfWeek)/Float(7) * 100))
    }
    
    static var daysInMonth: Int {
        return Calendar.current.range(of: .day, in: .month, for: Date())!.count
    }
    
    static func daysSinceDate(startDate: Date) -> Int {
        let startOfStartDate = Calendar.current.startOfDay(for: startDate)
        let dateComponents = Calendar.current.dateComponents([.day], from: startOfStartDate, to: Date())
        return dateComponents.day!
    }
    
    static func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let startOfStartDate = Calendar.current.startOfDay(for: startDate)
        let startOfEndDate = Calendar.current.startOfDay(for: endDate)
        let dateComponents = Calendar.current.dateComponents([.day], from: startOfStartDate, to: startOfEndDate)
        return dateComponents.day!
    }
    
    static func percentOfTimeSpanCompleted(startDate: Date, endDate: Date) -> Int {
        let daysSinceStartDate = daysSinceDate(startDate: startDate)
        let totalDaysInTimeSpan = daysBetweenDates(startDate: startDate, endDate: endDate)
        return Int((Float(daysSinceStartDate)/Float(totalDaysInTimeSpan) * 100))
    }
}
