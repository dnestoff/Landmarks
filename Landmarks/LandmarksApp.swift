//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Third User on 11/30/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    // Use @StateObject attribute to initialize a model object for a given property only ONCE during the life time of the app
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        // The WindowGroup scene declares ContentView as the root view of the app
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
