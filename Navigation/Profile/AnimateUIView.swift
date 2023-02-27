//
//  AnimateUIView.swift
//  Navigation
//
//  Created by Антон Зудинов on 26.02.2023.
//

import UIKit

class AnimateUIView: UIView {

    private let profileHeaderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
     }()

    let avatarImageView: UIImageView = {
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
    
    let avatarHideImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    let hideView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.5
        view.backgroundColor = .white
        return view
    }()
    
    let hideButton: UIButton = {
        let view = UIButton()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var leadigConstraint = NSLayoutConstraint()
    var topConstraint = NSLayoutConstraint()
    var widthConstraint = NSLayoutConstraint()
    var heightConstraint = NSLayoutConstraint()
    
    private func layout () {
        addSubview(profileHeaderView)
        profileHeaderView.addSubview(avatarHideImageView)
        profileHeaderView.addSubview(hideView)
        profileHeaderView.addSubview(hideButton)
        profileHeaderView.addSubview(avatarImageView)
        
        leadigConstraint = avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16)
        topConstraint = avatarImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16)
        heightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 120)
        widthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            avatarHideImageView.leadingAnchor.constraint(equalTo: profileHeaderView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarHideImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            avatarHideImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarHideImageView.widthAnchor.constraint(equalToConstant: 120),

            hideButton.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 12),
            hideButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 12),
            
            hideView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hideView.topAnchor.constraint(equalTo: topAnchor),
            hideView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hideView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            leadigConstraint,topConstraint, heightConstraint, widthConstraint
        ])
    }
}
