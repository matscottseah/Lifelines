//
//  UserData.swift
//  Deadline
//
//  Created by Matthew Seah on 1/21/23.
//

import Foundation

struct WeekOfLife {
    var weekNumber: Int
    var isCompleted: Bool
    
    init(weekNumber: Int, isCompleted: Bool) {
        self.weekNumber = weekNumber
        self.isCompleted = isCompleted
    }
}

class User: Codable {
    var firstName: String
    var lastName: String
    var birthDate: Date
    var lifeExpectancy: String
    
    var today: Date {
        return Date()
    }
    
    var deathDate: Date {
        var dateComponents = DateComponents()
        dateComponents.year = Int(lifeExpectancy)
        let date = Calendar.current.date(byAdding: dateComponents, to: birthDate)!
        
        return Calendar.current.startOfDay(for: date)
    }
    
    var totalDaysAlive: Int {
        let startOfBirthDate = Calendar.current.startOfDay(for: birthDate)
        
        let dateComponents = Calendar.current.dateComponents([.day], from: startOfBirthDate, to: deathDate)
        return dateComponents.day!
    }
    
    var daysSinceBirth: Int {
        let startOfBirthDate = Calendar.current.startOfDay(for: birthDate)
        
        let dateComponents = Calendar.current.dateComponents([.day], from: startOfBirthDate, to: today)
        return dateComponents.day!
    }
    
    var daysTillDeath: Int {
        let startOfdeathDate = Calendar.current.startOfDay(for: deathDate)
        
        let dateComponents = Calendar.current.dateComponents([.day], from: today, to: startOfdeathDate)
        return dateComponents.day!
    }
    
    var totalWeeksAlive: Int {
        let dateComponents = Calendar.current.dateComponents([.weekOfYear], from: birthDate, to: deathDate)
        
        return totalDaysAlive % 7 > 0
            ? dateComponents.weekOfYear! + 1
            : dateComponents.weekOfYear!
    }
    
    var wholeWeeksSinceBirth: Int {
        let dateComponents = Calendar.current.dateComponents([.weekOfYear], from: birthDate, to: today)
        
        return dateComponents.weekOfYear!
    }
    
    var wholeWeeksTillDeath: Int {
        let dateComponents = Calendar.current.dateComponents([.weekOfYear], from: today, to: deathDate)
        
        return dateComponents.weekOfYear!
    }
    
    var weeksOfLife: [WeekOfLife] {
        return (1...totalWeeksAlive).map { WeekOfLife(weekNumber: $0, isCompleted: $0 <= wholeWeeksSinceBirth) }
    }
    
    var percentOfLifeComplete: Int {
        return Int((Float(daysSinceBirth)/Float(totalDaysAlive) * 100))
    }
}
