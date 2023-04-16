//
//  postViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 16.04.2023.
//

import UIKit

class CellViewController: UIViewController {

    let postView = PostView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postView)
        view.backgroundColor = .white
        layout()
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            postView.topAnchor.constraint(equalTo: view.topAnchor),
            postView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
