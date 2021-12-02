//
//  ContentView.swift
//  Landmarks
//
//  Created by Third User on 11/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Update ContentView preview to add the model object to the environment, making object available to any subview
        ContentView()
            .environmentObject(ModelData())
    }
}
