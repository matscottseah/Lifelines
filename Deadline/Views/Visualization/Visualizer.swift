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
        let periodsSinceBirth = (1...userData.wholeWeeksSinceBirth).map { Period(id: $0, shape: .circle, color: .red, size: 10) }
        let periodsTillDeath =  (userData.wholeWeeksSinceBirth+1...userData.wholeWeeksSinceBirth+userData.wholeWeeksTillDeath).map { Period(id: $0, shape: .circle, color: .green, size: 10) }
        return periodsSinceBirth + periodsTillDeath
    }

    let columns = Array(repeating: GridItem(.flexible(minimum: 1, maximum: 10), spacing: 5), count: 26)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(periods, id: \.id) { period in
                    period
                }
            }
        }
    }
}

struct Visualizer_Previews: PreviewProvider {
    static var previews: some View {
        Visualizer()
            .environmentObject(UserData())
    }
}
