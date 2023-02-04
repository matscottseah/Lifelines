//
//  Header.swift
//  Deadline
//
//  Created by Matthew Seah on 1/24/23.
//

import SwiftUI

struct Header: View {
    var title: String
    @State private var showSettings: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
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
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Lifelines")
    }
}
