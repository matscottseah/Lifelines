//
//  UserInput.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            HStack {
                Text("User")
                    .font(.title2)
                Spacer()
            }
            
            DatePicker(
                "Birth Date",
                selection: $modelData.user.birthDate,
                displayedComponents: [.date]
            )
                .datePickerStyle(.compact)
            
            HStack {
                Text("Life Expectancy")
                
                Spacer()
                
                TextField(
                    "Age",
                    text: $modelData.user.lifeExpectancy
                )
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 50)
            }
            
            Divider()
            
            Spacer()
        }
            .padding()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(ModelData())
    }
}
