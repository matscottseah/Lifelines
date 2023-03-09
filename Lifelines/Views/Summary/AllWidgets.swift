//
//  Summary.swift
//  Lifelines
//
//  Created by Matthew Seah on 1/21/23.
//

import SwiftUI

struct AllWidgets: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            
            VStack() {
                Header(title: "Lifelines")
                    .padding()
                
                ScrollView {
                    TextWidget()
                    ProgressBarWidget()
                    AllProgressCirclesWidget()
                }
            }
        }
    }
}

struct AllWidgets_Previews: PreviewProvider {
    static var previews: some View {
        AllWidgets()
            .environmentObject(ModelData())
    }
}
