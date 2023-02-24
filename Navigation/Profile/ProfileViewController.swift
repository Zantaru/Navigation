//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 13.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var profileHeaderViewConstrain = [NSLayoutConstraint]()
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
        setupView()
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    private func setupLayout() {
    
        profileHeaderViewConstrain = [
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.bottomAnchor.constraint(equalTo: someButon.topAnchor),
            
            someButon.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            someButon.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            someButon.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
    
        NSLayoutConstraint.activate(profileHeaderViewConstrain)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        view.addSubview(someButon)
        setupLayout()
    }
}
