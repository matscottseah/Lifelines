//
//  ProgressBars.swift
//  Deadline
//
//  Created by Matthew Seah on 1/23/23.
//

import SwiftUI

struct LifeProgressBars: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.forward.2")
                    .font(.system(size: 15))
                    .foregroundColor(.blue)
                Text("Progress")
                    .font(.title3)
                    .bold()
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            .padding(.bottom)
            
            HStack {
                Text("Life: \(modelData.user.percentOfLifeComplete)%")
                    .frame(width: 110, alignment: .leading)
                ProgressView(value: Float(modelData.user.daysSinceBirth), total: Float(modelData.user.totalDaysAlive))
                    .tint(colorForPercentage(percentage: modelData.user.percentOfLifeComplete))
            }
            HStack {
                Text("Year: \(DateManager.percentOfYearComplete)%")
                    .frame(width: 110, alignment: .leading)
                ProgressView(value: Float(DateManager.dayOfYear), total: 365)
                    .tint(colorForPercentage(percentage: DateManager.percentOfYearComplete))
            }
            HStack {
                Text("Month: \(DateManager.percentOfMonthComplete)%")
                    .frame(width: 110, alignment: .leading)
                ProgressView(value: Float(DateManager.dayOfMonth), total: Float(DateManager.daysInMonth))
                    .tint(colorForPercentage(percentage: DateManager.percentOfMonthComplete))
            }
            HStack {
                Text("Week: \(DateManager.percentOfWeekComplete)%")
                    .frame(width: 110, alignment: .leading)
                ProgressView(value: Float(DateManager.dayOfWeek), total: 7)
                    .tint(colorForPercentage(percentage: DateManager.percentOfWeekComplete))
            }
        }
    }
    
    func colorForPercentage(percentage: Int) -> Color {
        if percentage <= 33 { return .green }
        else if percentage > 33 && percentage <= 66 { return .orange }
        else { return .red }
    }
}

struct LifeProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        LifeProgressBars()
            .environmentObject(ModelData())
            .padding()
    }
}
