//
//  Header.swift
//  Deadline
//
//  Created by Matthew Seah on 1/24/23.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Text("Lifelines")
                .font(.largeTitle)
                .bold()
            Spacer()
            SettingsButton()
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
