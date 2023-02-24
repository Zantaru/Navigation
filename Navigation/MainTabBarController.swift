//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Антон Зудинов on 18.02.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    private let feedViewController = UINavigationController(rootViewController: FeedViewController())
    private let profileViewController = UINavigationController(rootViewController: ProfileViewController())
    private let logInViwController = UINavigationController(rootViewController: LogInViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllres()
    }
    
    
    private func setupControllres() {
        feedViewController.tabBarItem.title = "Feed"
        feedViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        logInViwController.tabBarItem.title = "Prifile"
        logInViwController.tabBarItem.image = UIImage(systemName: "person.fill")
        viewControllers = [feedViewController,logInViwController]
    }
    
}
