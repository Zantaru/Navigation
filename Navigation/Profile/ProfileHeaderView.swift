//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Антон Зудинов on 18.02.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    private var statusText: String?
    private var portraitLayout = [NSLayoutConstraint]()
    
    lazy var fullNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Viktiriia Nikolaeva"
        return label
    }()
    
    lazy var statusLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Waiting for something..."
        return label
    }()

    lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BjceNTX0ZSU")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 60.0
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    
    lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4.0
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = .black
        textField.clearButtonMode = .always
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        return textField
    }()
    
    
    func layout () {
        addSubview(fullNameLabel)
        addSubview(avatarImageView)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        
        portraitLayout = [
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
        
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -72),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(portraitLayout)
        
    }
    
    @objc func statusTextChanged() {
        if statusTextField.text != nil {
            statusText = statusTextField.text!
        }
    }
    
    @objc func tapAction () {
        statusLabel.text = statusText
        print(statusText!)
    }
    
}
