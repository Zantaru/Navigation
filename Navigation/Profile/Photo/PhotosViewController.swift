//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 25.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {

    private let arrayForPhotoIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    var cellFrameInSuperview: CGRect = .zero
    private let animateView = AnimateUIView()
    private let photosColectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifaer)
        return view
    }()
    
    override func viewDidLoad() {
        navigationItem.title = "Photo Gallery"
        super.viewDidLoad()
        layout()
        setupPhotoCollection()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        let theAttributes = collectionView.layoutAttributesForItem(at: indexPath)
        cellFrameInSuperview = collectionView.convert(theAttributes?.frame ?? .zero, to: collectionView.superview)
        animateView.hideButton.addTarget(self, action: #selector(tapActionButton), for: .touchUpInside)
        animateView.avatarImageView.layer.cornerRadius = 0.0
        animateView.avatarImageView.clipsToBounds = true
        animateView.avatarImageView.contentMode = .scaleToFill
        animateView.avatarImageView.layer.borderWidth = 0.0
        animateView.avatarImageView.image = UIImage(named: "Foto-"+String(index+1))
        animateView.avatarHideImageView.backgroundColor = .white
        view.addSubview(animateView)
  
        NSLayoutConstraint.activate([
            animateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            animateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        animateView.topConstraint.constant = cellFrameInSuperview.minY - view.safeAreaLayoutGuide.layoutFrame.origin.y
        animateView.leadigConstraint.constant = cellFrameInSuperview.minX
        animateView.heightConstraint.constant = cellFrameInSuperview.height
        animateView.widthConstraint.constant = cellFrameInSuperview.width
        animateView.topAvatarHideConstraint.constant = cellFrameInSuperview.minY - view.safeAreaLayoutGuide.layoutFrame.origin.y
        animateView.leadingAvatarHideConstraint.constant = cellFrameInSuperview.minX
        animateView.heightAvatarHideConstraint.constant = cellFrameInSuperview.height
        animateView.widthAvatarHideConstraint.constant = cellFrameInSuperview.width
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
            self.animateView.leadigConstraint.constant = 0
            self.animateView.topConstraint.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width)/4
            self.animateView.widthConstraint.constant = UIScreen.main.bounds.width
            self.animateView.heightConstraint.constant = UIScreen.main.bounds.width
            self.animateView.avatarImageView.layer.cornerRadius = 0
            self.animateView.hideView.alpha = 0.7
            self.animateView.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
                self.animateView.hideButton.isHidden = false
                self.animateView.hideButton.alpha = 1.0
            }
        }
    }
    
    @objc private func tapActionButton() {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
            self.animateView.hideButton.alpha = 0
            self.animateView.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
                self.animateView.leadigConstraint.constant = self.cellFrameInSuperview.minX
                self.animateView.topConstraint.constant = self.cellFrameInSuperview.minY-self.view.safeAreaLayoutGuide.layoutFrame.origin.y
                self.animateView.widthConstraint.constant = self.cellFrameInSuperview.height
                self.animateView.heightConstraint.constant = self.cellFrameInSuperview.width
                self.animateView.hideView.alpha = 0
                self.animateView.layoutIfNeeded()
            } completion: { _ in
                self.animateView.removeFromSuperview()
            }
        }
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

