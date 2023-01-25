//
//  ProgressBars.swift
//  Deadline
//
//  Created by Matthew Seah on 1/23/23.
//

import SwiftUI

struct ProgressBars: View {
    @EnvironmentObject var userData: UserData
    
    var lifeStats: (Float, Float, Float) {
        return (Float((userData.daysSinceBirth/userData.totalDaysAlive) * 100), Float(userData.daysSinceBirth), Float(userData.totalDaysAlive))
    }

    var body: some View {
        VStack {
            HStack {
                Text("Life: \(20)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: lifeStats.1, total: lifeStats.2)
                    .tint(.black)
            }
            HStack {
                Text("Year: \(10)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: 10, total: 100)
                    .tint(.black)
            }
            HStack {
                Text("Month: \(90)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: 90, total: 100)
                    .tint(.black)
            }
            HStack {
                Text("Week: \(50)%")
                    .frame(width: 100, alignment: .leading)
                ProgressView(value: 50, total: 100)
                    .tint(.black)
            }
        }
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBars()
            .environmentObject(UserData())
            .padding()
    }
}
