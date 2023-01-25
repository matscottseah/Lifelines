//
//  SettingsButton.swift
//  Deadline
//
//  Created by Matthew Seah on 1/24/23.
//

import SwiftUI

struct SettingsButton: View {
    @State private var showSettings: Bool = false
    
    var body: some View {
        Button(action: { showSettings.toggle() } ) {
            Image(systemName: "person.fill")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }
        .sheet(isPresented: $showSettings) {
            Settings()
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
