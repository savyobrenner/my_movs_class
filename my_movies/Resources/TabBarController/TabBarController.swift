//
//  TabBarController.swift
//  my_movies
//
//  Created by Savyo Brenner on 16/09/22.
//

import UIKit

class TabBarController: UITabBarController {
    
    private enum Strings {
        static let homeTitle = "Home"
        static let favoritesTitle = "Favorites"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfiguration()
        configureScreens()
    }
    
    private func initialConfiguration() {
        DispatchQueue.main.async {
            self.navigationController?.navigationBar.isHidden = true
        }
    }
    
    private func configureScreens() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: Strings.homeTitle, image: UIImage(systemName: "house"), tag: 0)
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: Strings.favoritesTitle, image: UIImage(systemName: "bolt.heart"), tag: 0)
        
        let tabBarList = [homeViewController, favoritesViewController]
        viewControllers = tabBarList
    }
}


