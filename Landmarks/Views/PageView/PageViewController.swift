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
    
    // SwiftUI calls makeCoordinator() before makeUIViewController(context:), so you have access to the coordinator object when configuring view controller
        // Tip: use this coordinator to implement common Cocoa patterns, such as delegates, data sources, and responding to user events via target-action
    func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
    
    // makeUIViewController(context:) method that creates a UIPageViewController with the desired configuration
        // SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        // Add coordinator as the data source of the UIPageViewController
        pageViewController.dataSource = context.coordinator

        return pageViewController
    }

    // Add an updateUIViewController(_:context:) method that calls setViewControllers(_:direction:animated:) to provide a view controller for display
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource {
        var parent: PageViewController
        // Initialize an array of controllers in the coordinator using the pages array of views
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // Below two methods establish the relationships between view controllers, allow swiping back and forth between them
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }

        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }

    }

}
