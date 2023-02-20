//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 13.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let profileHeaderView = ProfileHeaderView()
    private let someButon: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Some Button", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        view.addSubview(someButon)

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.bottomAnchor.constraint(equalTo: someButon.topAnchor),
            
            someButon.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            someButon.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            someButon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
   
        ])
        profileHeaderView.layout()
        profileHeaderView.backgroundColor = .lightGray
    }
}
