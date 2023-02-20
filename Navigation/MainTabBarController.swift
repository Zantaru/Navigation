//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Антон Зудинов on 18.02.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let feedViewController = UINavigationController(rootViewController: FeedViewController())
    private let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllres()

        // Do any additional setup after loading the view.
    }
    
    private func setupControllres() {
        feedViewController.tabBarItem.title = "Feed"
        feedViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        profileViewController.tabBarItem.title = "Prifile"
        profileViewController.tabBarItem.image = UIImage(systemName: "person.fill")
        viewControllers = [feedViewController,profileViewController]
    }
    
}
