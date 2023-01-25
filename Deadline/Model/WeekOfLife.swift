//
//  WeekOfLife.swift
//  Deadline
//
//  Created by Matthew Seah on 1/22/23.
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
