//
//  UserInput.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

struct UserInput: View {
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
        }
        .padding()
    }
}

struct UserInput_Previews: PreviewProvider {    
    static var previews: some View {
        UserInput()
            .environmentObject(UserData())
    }
}
