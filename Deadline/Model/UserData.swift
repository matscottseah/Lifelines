//
//  UserData.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import Foundation
import SwiftUI

final class UserData: ObservableObject {
    @Published var birthDate: Date = Date(timeIntervalSince1970: 860396400)
    @Published var lifeExpectancy: String = "90"
    var today = Date()
    
    var totalDaysAlive: Int {
        let startOfBirthDate = Calendar.current.startOfDay(for: birthDate)
        let startOfDeadthDate = Calendar.current.startOfDay(for: deathDate)
        
        let diffComponents = Calendar.current.dateComponents([.day], from: startOfBirthDate, to: startOfDeadthDate)
        return diffComponents.day!
    }
    
    var deathDate: Date {
        var dateComponent = DateComponents()
        dateComponent.year = Int(lifeExpectancy)
        return Calendar.current.date(byAdding: dateComponent, to: birthDate)!
    }
    
    var daysSinceBirth: Int {
        let startOfBirthDate = Calendar.current.startOfDay(for: birthDate)
        let startOfToday = Calendar.current.startOfDay(for: today)
        
        let diffComponents = Calendar.current.dateComponents([.day], from: startOfBirthDate, to: startOfToday)
        return diffComponents.day!
    }
    
    var daysTillDeath: Int {
        let startOfToday = Calendar.current.startOfDay(for: today)
        let startOfdeathDate = Calendar.current.startOfDay(for: deathDate)
        
        let diffComponents = Calendar.current.dateComponents([.day], from: startOfToday, to: startOfdeathDate)
        return diffComponents.day!
    }
    
    var wholeTotalWeeksAlive: Int {
        return Int(totalDaysAlive / 7)
    }
    
    var wholeWeeksSinceBirth: Int {
        return Int(daysSinceBirth / 7)
    }
    
    var wholeWeeksTillDeath: Int {
        return Int(daysTillDeath / 7)
    }
}
