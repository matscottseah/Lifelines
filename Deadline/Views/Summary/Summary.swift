//
//  Summary.swift
//  Deadline
//
//  Created by Matthew Seah on 1/21/23.
//

import SwiftUI

struct Summary: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").ignoresSafeArea()
                
                VStack() {
                    Header(title: "Summary")
                        .padding()
                    
                    ScrollView {
                        HStack {
                            Text("**\(modelData.user.wholeWeeksTillDeath)** weeks left to live")
                                .font(.title)
                            Spacer()
                        }
                        .padding()
                        
                        NavigationLink(destination: LifeProgressBars()) {
                            Card(content: AnyView(LifeProgressBars()), width: .infinity)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary()
            .environmentObject(ModelData())
    }
}
