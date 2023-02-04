//
//  MilestoneItem.swift
//  Deadline
//
//  Created by Matthew Seah on 1/28/23.
//

import SwiftUI

struct MilestoneItem: View {
    var milestone: Milestone
    var showChevron: Bool = true
    
    var progressViewValue: Float { Float(DateManager.daysSinceDate(startDate: milestone.startDate)) }
    var progressViewTotal: Float { Float(DateManager.daysBetweenDates(startDate: milestone.startDate, endDate: milestone.endDate)) }
    var progressViewColor: Color {
        let percentComplete = DateManager.percentOfTimeSpanCompleted(startDate: milestone.startDate, endDate: milestone.endDate)
        
        if percentComplete <= 33 { return .green }
        else if percentComplete > 33 && percentComplete <= 66 { return .orange }
        else { return .red }
    }

    var body: some View {
        VStack {
            HStack {
                Text(milestone.title)
                Spacer()
                if (showChevron) {
                    Image(systemName: "chevron.forward")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    .padding(.bottom)
                }
            }
            
            HStack {
                Text("\(milestone.timeDurationString)")
                    .frame(width: 110, alignment: .leading)
                ProgressView(value: progressViewValue, total: progressViewTotal)
                    .tint(progressViewColor)
            }
        }
    }
}

struct MilestoneItem_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneItem(milestone: Milestone(startDate: Date(timeIntervalSince1970: 1649314800), endDate: Date(timeIntervalSince1970: 1680850800), title: "Birthday", isFavorite: false))
            .padding()
    }
}
