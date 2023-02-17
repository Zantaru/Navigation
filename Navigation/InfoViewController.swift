//
//  InfoViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 13.02.2023.
//

import UIKit

final class InfoViewController: UIViewController {

    private let nextPageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("ATANTION", for: .normal)
        button.backgroundColor = .black
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        allertButton()
    }
    
    private func allertButton(){
        view.addSubview(nextPageButton)
        nextPageButton.center = view.center
        nextPageButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction(){
        let allertController = UIAlertController(title: "WARNING!", message: "You are shure?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Yes", style: .default) {_ in
            print("YES")
        }
        let noAction = UIAlertAction(title: "No", style: .default) {_ in
            print("NO")
        }
        allertController.addAction(okAction)
        allertController.addAction(noAction)
        present(allertController, animated: true)
    }
}
