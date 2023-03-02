//
//  MilestoneDetails.swift
//  Deadline
//
//  Created by Matthew Seah on 1/28/23.
//

import SwiftUI

struct InspectMilestone: View {
    @EnvironmentObject var modelData: ModelData
    var milestoneIndex: Int
    var isInEditMode: Bool = false
    
    var milestone: Milestone { modelData.milestones[milestoneIndex] }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ScrollView {
                VStack {
                    Card(content: AnyView(MilestoneItem(milestoneIndex: 0, showChevron: false)), width: .infinity)
                    Card(content: AnyView(MilestoneDetails(milestoneIndex: milestoneIndex)), width: .infinity)
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InspectMilestone_Previews: PreviewProvider {
    static var previews: some View {
        InspectMilestone(milestoneIndex: 0)
            .environmentObject(ModelData())
    }
}
