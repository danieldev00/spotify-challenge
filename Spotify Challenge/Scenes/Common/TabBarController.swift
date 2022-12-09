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
        
        view.backgroundColor = .background
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .navigation
        appearance.selectionIndicatorTintColor = .accent
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = .accent
        UITabBar.appearance().unselectedItemTintColor = .white
 
        viewControllers = [
            createNavController(for: NewReleasesController(), title: "New Releases", icon: "tabbar_star"),
            createNavController(for: GenresController(), title: "Genres", icon: "tabbar_list")
        ]
    }

    fileprivate func createNavController(for viewController: UIViewController, title: String, icon: String) -> UIViewController {
        viewController.navigationItem.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .navigation
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: icon)
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.isTranslucent = false
        return navController
    }
}
