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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupButton()

    }

    private func setupButton() {
        view.addSubview(nextPageButton)
        nextPageButton.center = view.center
        nextPageButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        let postScreen = PostViewController(textOfTitle: post.title)
        navigationController?.pushViewController(postScreen, animated: true)
        
    }
    
}
