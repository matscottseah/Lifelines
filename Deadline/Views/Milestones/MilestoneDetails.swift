//
//  MilestoneDetails.swift
//  Deadline
//
//  Created by Matthew Seah on 2/4/23.
//

import SwiftUI

struct MilestoneDetails: View {
    var milestone: Milestone
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "sunrise.fill")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Start")
                Spacer()
                Text("\(milestone.startDate.dateString())")
            }
            
            HStack {
                Image(systemName: "sunset.fill")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Finish")
                Spacer()
                Text("\(milestone.endDate.dateString())")
            }
            
            HStack {
                Image(systemName: "hourglass")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Total")
                Spacer()
                Text("\(milestone.startDate)")
            }
            
            HStack {
                Image(systemName: "hourglass.tophalf.filled")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Past")
                Spacer()
                Text("\(milestone.startDate)")
            }
            
            HStack {
                Image(systemName: "hourglass.bottomhalf.filled")
                    .font(.system(size: 15))
                    .foregroundColor(Color("PrimaryTextColor"))
                Text("Remaining")
                Spacer()
                Text("\(milestone.startDate)")
            }
        }
    }
}

struct MilestoneDetails_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneDetails(milestone: Milestone(startDate: Date(timeIntervalSince1970: 1672560000), endDate: Date(timeIntervalSince1970: 1704009600), title: "Title", isFavorite: false))
    }
}
