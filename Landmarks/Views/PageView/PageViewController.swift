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
    @Binding var currentPage: Int
    
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
        // Add coordinator as the data source and delegate for the UIPageViewController
            // With the binding connected in both directions, the text view updates to show the correct page number after each swipe
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator

        return pageViewController
    }

    // Add an updateUIViewController(_:context:) method that calls setViewControllers(_:direction:animated:) to provide a view controller for display
        // passes the value of the currentPage binding
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
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
        
        // Because SwiftUI calls this method whenever a page switching animation completes, you can find the index of the current view controller and update the binding
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }

    }

}
