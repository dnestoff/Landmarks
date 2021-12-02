//
//  MapView.swift
//  Landmarks
//
//  Created by Third User on 11/30/21.
//

import SwiftUI
import MapKit // Add an import statement for MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

//    @State private var region = MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
//            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
//        )
    @State private var region = MKCoordinateRegion()

    
    var body: some View {
        // By prefixing a state variable with $, you pass a binding.
        // When user interacts with map, the map updates region value
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
