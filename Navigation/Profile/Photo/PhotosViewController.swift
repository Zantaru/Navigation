//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 25.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {

    private let arrayForPhotoIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

    private let photosColectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifaer)
        return view
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupPhotoCollection()
        navigationItem.title = "Photo Gallery"
    }
    
    private func setupPhotoCollection() {
        photosColectionView.dataSource = self
        photosColectionView.delegate = self
    }
    
    private func layout() {
        view.addSubview(photosColectionView)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            photosColectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosColectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosColectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosColectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayForPhotoIndex.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifaer, for: indexPath) as! PhotoCollectionViewCell
        cell.setupCell(index: indexPath.item)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 10 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4)/3
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}
