//
//  ContentView.swift
//  Landmarks
//
//  Created by Third User on 11/30/21.
//

import SwiftUI

struct ContentView: View {
    // State variable for the tab selection, with "featured" as default
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        // LandmarkList()
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Update ContentView preview to add the model object to the environment, making object available to any subview
        ContentView()
            .environmentObject(ModelData())
    }
}
