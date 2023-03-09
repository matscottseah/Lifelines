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
    
    static var ammountOfYearComplete: Double {
        return Double((Float(dayOfYear)/Float(365)))
    }
    
    static var dayOfMonth: Int {
        return Calendar.current.ordinality(of: .day, in: .month, for: Date())!
    }
    
    static var ammountOfMonthComplete: Double {
        return Double((Float(dayOfMonth)/Float(daysInMonth)))
    }
    
    static var dayOfWeek: Int {
        let dateComponents = Calendar.current.dateComponents([.weekday], from: Date())
        return dateComponents.weekday!
    }
    
    static var ammountOfWeekComplete: Double {
        return Double((Float(dayOfWeek)/Float(7)))
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
