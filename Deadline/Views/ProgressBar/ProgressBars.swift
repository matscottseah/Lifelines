//
//  ProgressBars.swift
//  Deadline
//
//  Created by Matthew Seah on 1/23/23.
//

import SwiftUI

struct ProgressBars: View {
    @EnvironmentObject var userData: UserData
    var dateManager = DateManager()
    
    var lifeBarColor: Color {
        if userData.percentOfLifeComplete <= 33 { return .green }
        else if userData.percentOfLifeComplete > 33 && userData.percentOfLifeComplete <= 66 { return .orange }
        else { return .red }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Life: \(userData.percentOfLifeComplete)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: Float(userData.daysSinceBirth), total: Float(userData.totalDaysAlive))
                    .tint(colorForPercentage(percentage: userData.percentOfLifeComplete))
            }
            HStack {
                Text("Year: \(dateManager.percentOfYearComplete)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: Float(dateManager.dayOfYear), total: 365)
                    .tint(colorForPercentage(percentage: dateManager.percentOfYearComplete))
            }
            HStack {
                Text("Month: \(dateManager.percentOfMonthComplete)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: Float(dateManager.dayOfMonth), total: Float(dateManager.daysInMonth))
                    .tint(colorForPercentage(percentage: dateManager.percentOfMonthComplete))
            }
            HStack {
                Text("Week: \(dateManager.percentOfWeekComplete)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: Float(dateManager.dayOfWeek), total: 7)
                    .tint(colorForPercentage(percentage: dateManager.percentOfWeekComplete))
            }
        }
    }
    
    func colorForPercentage(percentage: Int) -> Color {
        if percentage <= 33 { return .green }
        else if percentage > 33 && percentage <= 66 { return .orange }
        else { return .red }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBars()
            .environmentObject(UserData())
            .padding()
    }
}
