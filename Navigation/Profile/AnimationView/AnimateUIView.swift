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
        view.alpha = 0.0
        view.backgroundColor = .white
        return view
    }()
    
    let hideButton: UIButton = {
        let view = UIButton()
        view.isHidden = true
        view.alpha = 0.0
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
    var topAvatarHideConstraint = NSLayoutConstraint()
    var leadingAvatarHideConstraint = NSLayoutConstraint()
    var heightAvatarHideConstraint = NSLayoutConstraint()
    var widthAvatarHideConstraint = NSLayoutConstraint()
    
    public let insert:CGFloat = 16
    public let avatarInsert:CGFloat = 64
    
    private func layout () {
        addSubview(profileHeaderView)
        profileHeaderView.addSubview(avatarHideImageView)
        profileHeaderView.addSubview(hideView)
        profileHeaderView.addSubview(hideButton)
        profileHeaderView.addSubview(avatarImageView)
        
        leadigConstraint = avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: insert)
        topConstraint = avatarImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: avatarInsert - 40)
        heightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 120)
        widthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        topAvatarHideConstraint = avatarHideImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: avatarInsert - 40)
        leadingAvatarHideConstraint = avatarHideImageView.leadingAnchor.constraint(equalTo: profileHeaderView.safeAreaLayoutGuide.leadingAnchor, constant: insert)
        heightAvatarHideConstraint = avatarHideImageView.heightAnchor.constraint(equalToConstant: 120)
        widthAvatarHideConstraint = avatarHideImageView.widthAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            topAvatarHideConstraint, leadingAvatarHideConstraint, heightAvatarHideConstraint, widthAvatarHideConstraint,

            hideButton.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: insert),
            hideButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: insert),
            
            hideView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hideView.topAnchor.constraint(equalTo: topAnchor),
            hideView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hideView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            leadigConstraint, topConstraint, heightConstraint, widthConstraint
        ])
    }
}
