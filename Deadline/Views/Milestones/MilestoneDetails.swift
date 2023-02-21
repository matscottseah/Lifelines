//
//  MilestoneDetails.swift
//  Deadline
//
//  Created by Matthew Seah on 2/4/23.
//

import SwiftUI

struct MilestoneDetails: View {
    @EnvironmentObject var modelData: ModelData
    var milestoneIndex: Int
    
    var milestone: Milestone { modelData.milestones[milestoneIndex] }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "flag.fill")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Start")
                Spacer()
                Text("\(milestone.startDate.dateString())")
            }
            .padding(.bottom)
            
            HStack {
                Image(systemName: "flag.2.crossed.fill")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Finish")
                Spacer()
                Text("\(milestone.endDate.dateString())")
            }
            .padding(.bottom)
            
            HStack {
                Image(systemName: "hourglass")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Total")
                Spacer()
                Text("\(milestone.totalTimeDurationString)")
            }
            .padding(.bottom)
            
            HStack {
                Image(systemName: "hourglass.tophalf.filled")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Past")
                Spacer()
                Text("\(milestone.pastTimeDurationString)")
            }
            .padding(.bottom)
            
            HStack {
                Image(systemName: "hourglass.bottomhalf.filled")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Remaining")
                Spacer()
                Text("\(milestone.remainingTimeDurationString)")
            }
        }
    }
}

struct MilestoneDetails_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneDetails(milestoneIndex: 0)
            .environmentObject(ModelData())
    }
}
