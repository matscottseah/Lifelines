//
//  MilestoneDetails.swift
//  Deadline
//
//  Created by Matthew Seah on 1/28/23.
//

import SwiftUI

struct InspectMilestone: View {
    var milestone: Milestone
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView {
                VStack {
                    Card(content: AnyView(MilestoneItem(milestone: milestone)), width: .infinity)
                    
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InspectMilestone_Previews: PreviewProvider {
    static var previews: some View {
        InspectMilestone(milestone: Milestone(startDate: Date(timeIntervalSince1970: 1672560000), endDate: Date(timeIntervalSince1970: 1704009600), title: "Title", isFavorite: false))
    }
}
