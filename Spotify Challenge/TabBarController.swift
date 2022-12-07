//
//  TabBarController.swift
//  Spotify Challenge
//
//  Created by Daniel Azuaje on 7/12/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(for: NewReleasesController(), title: "New Releases", icon: ""),
            createNavController(for: NewReleasesController(), title: "Trending", icon: "")
        ]
    }

    fileprivate func createNavController(for viewController: UIViewController, title: String, icon: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: icon)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        return navController
    }
}
