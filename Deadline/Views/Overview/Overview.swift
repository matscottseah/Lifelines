//
//  Overview.swift
//  Deadline
//
//  Created by Matthew Seah on 1/21/23.
//

import SwiftUI

struct Overview: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                VStack() {
                    Header()
                        .padding()
                    ScrollView {
                        NavigationLink(destination: ProgressBars()) {
                            VStack(alignment: .leading) {
                                Card(title: "Progress", content: AnyView(ProgressBars()), width: UIScreen.screenWidth-40)

                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom)

//                        NavigationLink(destination: LifeGrid()) {
//                            VStack(alignment: .leading) {
//                                Card(title: "\(userData.wholeWeeksTillDeath) Weeks left to live", content: AnyView(LifeGrid()), width: UIScreen.screenWidth-40)
//                            }
//                        }
//                        .buttonStyle(PlainButtonStyle())
                    }
                    Spacer()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)        }
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
            .environmentObject(UserData())
    }
}
