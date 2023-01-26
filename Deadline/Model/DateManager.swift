//
//  DateManager.swift
//  Deadline
//
//  Created by Matthew Seah on 1/25/23.
//

import Foundation

struct DateManager {
    var today = Date()
    
    var dayOfYear: Int {
        return Calendar.current.ordinality(of: .day, in: .year, for: today)!
    }
    
    var percentOfYearComplete: Int {
        return Int((Float(dayOfYear)/Float(365) * 100))
    }
    
    var dayOfMonth: Int {
        return Calendar.current.ordinality(of: .day, in: .month, for: today)!
    }
    
    var percentOfMonthComplete: Int {
        return Int((Float(dayOfMonth)/Float(daysInMonth) * 100))
    }
    
    var dayOfWeek: Int {
        let dateComponents = Calendar.current.dateComponents([.weekday], from: today)
        return dateComponents.weekday!
    }
    
    var percentOfWeekComplete: Int {
        return Int((Float(dayOfWeek)/Float(7) * 100))
    }
    
    var daysInMonth: Int {
        return Calendar.current.range(of: .day, in: .month, for: today)!.count
    }
}
