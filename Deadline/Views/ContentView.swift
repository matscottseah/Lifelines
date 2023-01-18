//
//  ContentView.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            UserInput()
            Visualizer()
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(UserData())
        }
    }
}
