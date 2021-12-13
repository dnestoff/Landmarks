//
//  ModelData.swift
//  Landmarks
//
//  Created by Third User on 12/1/21.
//

import Foundation
import Combine

// Declare new model type that conforms to ObservableObject protocol from the Combine framework.
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    // Include an instance of the user profile that persists after user dismisses profile view
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    // Add a computed categories dictionary,
        // has category names as keys and an array of landmarks for each key
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }

}

// Create an array of landmarks initialized from landmarkData.json.
var landmarks: [Landmark] = load("landmarkData.json")

// The load method relies on the return type’s conformance to the Decodable protocol,
    //which is one component of the Codable protocol.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

