//
//  MilestoneFavorites.swift
//  Deadline
//
//  Created by Matthew Seah on 2/3/23.
//

import SwiftUI

struct MilestoneFavorites: View {
    @EnvironmentObject var modelData: ModelData
    
    var favoriteMilestones: [Milestone] {
        modelData.milestones.filter { $0.isFavorite == true }
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "star.fill")
                    .font(.system(size: 15))
                    .foregroundColor(.yellow)
                Text("Milestones")
                    .font(.title3)
                    .bold()
                Spacer()
                Image(systemName: "chevron.forward")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            .padding(.bottom)
            
            ForEach(Array(favoriteMilestones.enumerated()), id: \.offset) { index, element in
                MilestoneItem(milestoneIndex: index, showChevron: false, isInEditMode: true)
                
                if (index < favoriteMilestones.count - 1) {
                    Divider()
                }
            }
        }
    }
}

struct MilestoneFavorites_Previews: PreviewProvider {
    static var previews: some View {
        MilestoneFavorites()
            .environmentObject(ModelData())
    }
}
