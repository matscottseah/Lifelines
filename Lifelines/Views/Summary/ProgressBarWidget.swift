//
//  ProgressBars.swift
//  Deadline
//
//  Created by Matthew Seah on 1/23/23.
//

import SwiftUI

struct ProgressBarWidget: View {
    @EnvironmentObject var modelData: ModelData
    var color: Color {
        if modelData.user.ammountOfLifeCompleted <= 0.5 { return .green }
        else if modelData.user.ammountOfLifeCompleted > 0.5 && modelData.user.ammountOfLifeCompleted <= 0.8 { return .orange }
        else { return .red }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Text("Life: \(modelData.user.percentOfLifeCompleted)%")
                .font(.title3)
                .bold()
                .padding(.bottom)
            
            ProgressView(value: Float(modelData.user.daysSinceBirth), total: Float(modelData.user.totalDaysAlive))
                .tint(color)
        }
    }
    
    var body: some View {
        CardView(content: AnyView(content), width: .infinity)
    }
    
    func colorForPercentage(percentage: Double) -> Color {
        if percentage <= 0.5 { return .green }
        else if percentage > 0.5 && percentage <= 0.8 { return .orange }
        else { return .red }
    }
}

struct ProgressBarWidge_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarWidget()
            .environmentObject(ModelData())
            .background(Color.gray)
    }
}
