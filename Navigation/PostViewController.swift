//
//  PostViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 13.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    private var textTitle: String?
    
    init(textOfTitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        textTitle = textOfTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPost()
        makeBarItem()        
    }
    
    private func setupPost() {
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = textTitle
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Allert", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
        
    }
    
    @objc private func barItemAction() {
        let thirdVC = InfoViewController()
        present(thirdVC, animated: true)
    }

}
