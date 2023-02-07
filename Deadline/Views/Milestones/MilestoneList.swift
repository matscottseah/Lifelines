//
//  Milestones.swift
//  Deadline
//
//  Created by Matthew Seah on 1/26/23.
//

import SwiftUI

struct MilestoneList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                VStack() {
                    Header(title: "Milestones")
                        .padding()
                    
                    Button(action: {}) {
                        Card(content: AnyView(NewMilestoneButton()), width: .infinity)
                    }
                    
                    ScrollView {
                        ForEach(Array(modelData.milestones.enumerated()), id: \.offset) { index, element in
                            NavigationLink(destination: InspectMilestone(milestone: element)) {
                                Card(content: AnyView(MilestoneItem(milestone: element)), width: .infinity)
                            }
                            .navigationTitle("Milestones")
                            .navigationBarTitleDisplayMode(.inline)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct MilestoneList_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneList()
            .environmentObject(ModelData())
    }
}
