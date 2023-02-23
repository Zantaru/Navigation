//
//  FeedViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 13.02.2023.
//

import UIKit

struct Post {
    var title: String
}

final class FeedViewController: UIViewController {

    var post = Post(title: "Hello World!")
    
    private let nextPageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Сообщение", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private let nextPageButton2: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Еще одно", for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private let myStackView: UIStackView = {
        let myStackView = UIStackView()
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        myStackView.axis = .vertical
        myStackView.spacing = 10
        return myStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Feed"
        view.addSubview(myStackView)
        myStackView.addArrangedSubview(nextPageButton)
        myStackView.addArrangedSubview(nextPageButton2)
        setupButton()
        
        NSLayoutConstraint.activate([
            myStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupButton() {
        nextPageButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        nextPageButton2.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        let postScreen = PostViewController(textOfTitle: post.title)
        navigationController?.pushViewController(postScreen, animated: true)
    }
}
