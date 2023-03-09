//
//  AllProgressCirclesWidget.swift
//  Lifelines
//
//  Created by Matthew Seah on 3/7/23.
//

import SwiftUI

struct AllProgressCirclesWidget: View {
    @EnvironmentObject var modelData: ModelData
    
    var content: some View {
        VStack {
            HStack() {
                CircularProgressView(progress: modelData.user.ammountOfLifeCompleted, label: "Life", size: 60)
                Spacer()
                CircularProgressView(progress: DateManager.ammountOfYearComplete, label: "Year", size: 60)
                Spacer()
                CircularProgressView(progress: DateManager.ammountOfMonthComplete, label: "Quarter", size: 60)
                Spacer()
                CircularProgressView(progress: DateManager.ammountOfYearComplete, label: "Month", size: 60)
                Spacer()
                CircularProgressView(progress: DateManager.ammountOfWeekComplete, label: "Week", size: 60)
            }
        }
    }

    var body: some View {
        CardView(content: AnyView(content), width: .infinity)
    }
}

struct AllProgressCirclesWidget_Previews: PreviewProvider {
    static var previews: some View {
        AllProgressCirclesWidget()
            .environmentObject(ModelData())
            .background(Color.gray)
    }
}
