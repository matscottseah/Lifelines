//
//  DeadlineApp.swift
//  Deadline
//
//  Created by Matthew Seah on 1/14/23.
//

import SwiftUI

@main
struct DeadlineApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
