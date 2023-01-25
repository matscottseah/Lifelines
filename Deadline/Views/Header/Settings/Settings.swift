//
//  UserInput.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            DatePicker(
                "Birth Date",
                selection: $userData.birthDate,
                displayedComponents: [.date]
            )
                .datePickerStyle(.compact)
            
            HStack {
                Text("Life Expectancy")
                
                Spacer()
                
                TextField(
                    "Age",
                    text: $userData.lifeExpectancy
                )
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 50)
            }
            
            Spacer()
        }
            .padding()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
            .environmentObject(UserData())
    }
}
