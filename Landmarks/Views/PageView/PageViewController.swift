//
//  PageViewController.swift
//  Landmarks
//
//  Created by Third User on 12/14/21.
//

import SwiftUI
import UIKit

// The page view controller stores an array of Page instances, which must be a type of View. These are the pages you use to scroll between landmarks
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    // makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration
        // SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
    }

    // Add an updateUIViewController(_:context:) method that calls setViewControllers(_:direction:animated:) to provide a view controller for display
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}
