//
//  Milestone.swift
//  Deadline
//
//  Created by Matthew Seah on 1/26/23.
//

import Foundation

class Milestone: Codable, Identifiable {
    var id: String
    var startDate: Date
    var endDate: Date
    var title: String
    var isFavorite: Bool
    
    init(startDate: Date, endDate: Date, title: String, isFavorite: Bool) {
        self.id = NSUUID().uuidString
        self.startDate = startDate
        self.endDate = endDate
        self.title = title
        self.isFavorite = isFavorite
    }
    
    init() {
        self.id = NSUUID().uuidString
        self.startDate = Date()
        self.endDate = Date()
        self.title = "New Milestone"
        self.isFavorite = false
    }
    
    var timeDurationString: String {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day]
        return formatter.string(from: Date(), to: endDate)!
    }
}
