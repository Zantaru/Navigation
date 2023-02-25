//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Антон Зудинов on 25.02.2023.
//

import UIKit
class PhotosTableViewCell: UITableViewCell {
    
    private let viewConten: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.text = "Photos"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var nextButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        return view
    }()
    
    private let stackFoto: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    private let photoImage1: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.image = UIImage(named: "Foto-1")
        return view
    }()
    
    private let photoImage2: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.image = UIImage(named: "Foto-2")
        return view
    }()
    
    private let photoImage3: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.image = UIImage(named: "Foto-3")
        return view
    }()
    
    private let photoImage4: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.image = UIImage(named: "Foto-4")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        contentView.addSubview(viewConten)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nextButton)
        contentView.addSubview(stackFoto)
        stackFoto.addArrangedSubview(photoImage1)
        stackFoto.addArrangedSubview(photoImage2)
        stackFoto.addArrangedSubview(photoImage3)
        stackFoto.addArrangedSubview(photoImage4)
        
        NSLayoutConstraint.activate([
        
            viewConten.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewConten.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewConten.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewConten.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: viewConten.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: viewConten.leadingAnchor, constant: 12),
            
            nextButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: viewConten.trailingAnchor, constant: -12),
            
            stackFoto.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            stackFoto.leadingAnchor.constraint(equalTo: viewConten.leadingAnchor, constant: 12),
            stackFoto.trailingAnchor.constraint(equalTo: viewConten.trailingAnchor, constant: -12),
            stackFoto.bottomAnchor.constraint(equalTo: viewConten.bottomAnchor, constant: -12),
  
            photoImage1.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
            photoImage1.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
            
            photoImage2.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
            photoImage2.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
            
            photoImage3.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
            photoImage3.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
            
            photoImage4.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
            photoImage4.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 54)/4),
        
        ])
    }
}
