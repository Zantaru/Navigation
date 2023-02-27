//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Антон Зудинов on 25.02.2023.
//

import UIKit
final class PhotosTableViewCell: UITableViewCell {
    
    private let arrayForPhotoIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    private let photosColectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifaer)
        return view
    }()

    private func setupPhotoCollection() {
        photosColectionView.dataSource = self
        photosColectionView.delegate = self
    }
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupPhotoCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        contentView.addSubview(viewConten)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nextButton)
        contentView.addSubview(photosColectionView)
        
        NSLayoutConstraint.activate([
        
            viewConten.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewConten.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewConten.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewConten.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: viewConten.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: viewConten.leadingAnchor, constant: 12),
            
            nextButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: viewConten.trailingAnchor, constant: -12),
            
            photosColectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 12),
            photosColectionView.leadingAnchor.constraint(equalTo: viewConten.leadingAnchor),
            photosColectionView.trailingAnchor.constraint(equalTo: viewConten.trailingAnchor),
            photosColectionView.bottomAnchor.constraint(equalTo: viewConten.bottomAnchor, constant: -12),
            photosColectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 39)/4)
        ])
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayForPhotoIndex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifaer, for: indexPath) as! PhotoCollectionViewCell
        cell.setupCell(index: indexPath.item)
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - sideInset * 5)/4
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
}
