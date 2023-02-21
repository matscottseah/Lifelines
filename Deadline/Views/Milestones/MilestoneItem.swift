//
//  MilestoneItem.swift
//  Deadline
//
//  Created by Matthew Seah on 1/28/23.
//

import SwiftUI

struct MilestoneItem: View {
    @EnvironmentObject var modelData: ModelData
    var milestoneIndex: Int
    var showChevron: Bool = true
    var isInEditMode: Bool = false
    
    var milestone: Milestone { modelData.milestones[milestoneIndex] }
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
                TextField("Milestone Title", text: $modelData.milestones[milestoneIndex].title)
                    .disabled(isInEditMode)
                    .font(Font.body.weight(.bold))
                Spacer()
                if (showChevron) {
                    Image(systemName: "chevron.forward")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                    .padding(.bottom)
                }
            }
            
            HStack {
                Text("\(milestone.remainingTimeDurationString)")
                    .frame(width: 110, alignment: .leading)
                ProgressView(value: progressViewValue, total: progressViewTotal)
                    .tint(progressViewColor)
            }
        }
    }
}

struct MilestoneItem_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneItem(milestoneIndex: 0)
            .environmentObject(ModelData())
            .padding()
    }
}
