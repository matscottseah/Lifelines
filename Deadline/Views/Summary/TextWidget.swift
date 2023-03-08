//
//  TextWidget.swift
//  Deadline
//
//  Created by Matthew Seah on 3/7/23.
//

import SwiftUI

struct TextWidget: View {
    @EnvironmentObject var modelData: ModelData
    
    var content: some View {
        HStack {
            Text("**\(modelData.user.wholeWeeksTillDeath)** weeks left to live")
                .font(.title)
            Spacer()
        }
    }
    
    var body: some View {
        CardView(content: AnyView(content), width: .infinity)
    }
}

struct TextWidget_Previews: PreviewProvider {
    static var previews: some View {
        TextWidget()
            .environmentObject(ModelData())
            .background(Color.gray)
    }
}
