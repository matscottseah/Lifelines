//
//  Visualizer.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

struct Visualizer: View {
    @EnvironmentObject var userData: UserData
    
    var periods: [Period] {
        let periodsSinceBirth = (1...userData.wholeWeeksSinceBirth).map { Period(id: $0, shape: .circle, color: .red) }
        let periodsTillDeath =  (userData.wholeWeeksSinceBirth+1...userData.wholeWeeksSinceBirth+userData.wholeWeeksTillDeath).map { Period(id: $0, shape: .circle, color: .green) }
        return periodsSinceBirth + periodsTillDeath
//        [Period](repeating: Period(shape: .circle, color: .red), count: userData.wholeWeeksSinceBirth) +
//        [Period](repeating: Period(shape: .circle, color: .green), count: userData.wholeWeeksTillDeath)
    }

    let columns = [GridItem](repeating: GridItem(.fixed(5), spacing: 5), count: 52)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(periods, id: \.id) { period in
                    period
                }
            }
        }
        .padding(.horizontal)
    }
}

struct Visualizer_Previews: PreviewProvider {
    static var previews: some View {
        Visualizer()
            .environmentObject(UserData())
    }
}
