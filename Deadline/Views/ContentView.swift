//
//  ContentView.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @State private var showingSheet: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("You have \(userData.wholeWeeksTillDeath) weeks left to live.")
                    .font(.largeTitle)
                Spacer()
                Button(action: { showingSheet.toggle() } ) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showingSheet) {
                    UserInput()
                }
            }
            .padding(.bottom)
            Visualizer()
        }
        .padding()
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
