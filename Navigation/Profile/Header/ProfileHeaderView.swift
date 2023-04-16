//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Антон Зудинов on 18.02.2023.
//

import UIKit

final class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private var statusText: String?
    
    private let profileHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
     }()
    
    private let fullNameLabel: UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.text = "Viktiriia Nikolaeva"
        return view
    }()
    
    private let statusLabel: UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .gray
        view.text = "Waiting for something..."
        return view
    }()

    var avatarImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "BjceNTX0ZSU")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 60.0
        view.layer.borderWidth = 3.0
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    private var leadigConstraint = NSLayoutConstraint()
    private var topConstraint = NSLayoutConstraint()
    private var widthConstraint = NSLayoutConstraint()
    private var heightConstraint = NSLayoutConstraint()
    
    lazy var setStatusButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4.0
        view.setTitle("Show status", for: .normal)
        view.backgroundColor = UIColor(hex: "#4885cc")
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.7
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 4.0
        view.layer.masksToBounds = false
        view.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return view
    }()
    
    lazy var statusTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.font = UIFont.systemFont(ofSize: 15)
        view.textColor = .black
        view.clearButtonMode = .always
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        view.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: view.frame.height))
        view.leftViewMode = .always
        return view
    }()
    
    override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
        layout ()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout () {
        addSubview(profileHeaderView)
        profileHeaderView.addSubview(fullNameLabel)
        profileHeaderView.addSubview(avatarImageView)
        profileHeaderView.addSubview(statusLabel)
        profileHeaderView.addSubview(setStatusButton)
        profileHeaderView.addSubview(statusTextField)
        
        leadigConstraint = avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16)
        topConstraint = avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16)
        heightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 120)
        widthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            leadigConstraint,topConstraint, heightConstraint, widthConstraint,
            
            avatarImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            
            fullNameLabel.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 36),
            setStatusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -72),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),

            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func statusTextChanged() {
        if statusTextField.text != nil {
            statusText = statusTextField.text!
        }
    }
    
    @objc func tapAction () {
        if statusText == nil || statusText == "" {
            statusTextField.shake()
        } else {
            statusLabel.text = statusText
        }
    }
}
