//
//  Visualizer.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

struct LifeGrid: View {
    @EnvironmentObject var modelData: ModelData
    
    var lifeGridItems: [LifeGridItem] {
        return modelData.user.weeksOfLife.map { LifeGridItem(id: $0.weekNumber, color: $0.isCompleted ? Color("CompletedWeekColor") : Color("UncompletedWeekColor"), size: 5) }
    }
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 0, maximum: 7), spacing: 2), count: 52)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(lifeGridItems, id: \.id) { period in
                    period
                }
            }
        }
    }
}

struct LifeGrid_Previews: PreviewProvider {
    static var previews: some View {
        LifeGrid()
            .environmentObject(ModelData())
            .padding()
    }
}
