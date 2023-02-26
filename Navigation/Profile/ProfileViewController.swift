//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 13.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    private let post = Post.makePostsArray()
    private let animateView = AnimateUIView()
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifaer)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifaer)
        return tableView
    }()
   
    override func loadView() {
        super.loadView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.backgroundColor = .white
        layout()
        srtupAction()
    }
    
    @objc private func tapActionAvatar() {
        view.addSubview(animateView)
        
        NSLayoutConstraint.activate([
            animateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 22),
            animateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            animateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 2.0, delay: 0.9, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
            self.animateView.leadigConstraint.constant = 0
            self.animateView.topConstraint.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width)/6
            self.animateView.widthConstraint.constant = UIScreen.main.bounds.width
            self.animateView.heightConstraint.constant = UIScreen.main.bounds.width
            self.animateView.avatarImageView.layer.cornerRadius = 0
            self.animateView.hideView.alpha = 0.7
            self.animateView.layoutIfNeeded()
        } completion: { _ in
            self.animateView.hideButton.isHidden = false
        }
    }
    
    @objc private func tapActionButton() {
        UIView.animate(withDuration: 2.0, delay: 0.9, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut) {
            self.animateView.leadigConstraint.constant = 16
            self.animateView.topConstraint.constant = 16
            self.animateView.widthConstraint.constant = 120
            self.animateView.heightConstraint.constant = 120
            self.animateView.avatarImageView.layer.cornerRadius = 60
            self.animateView.hideButton.isHidden = true
            self.animateView.hideView.alpha = 0
            self.animateView.layoutIfNeeded()
        } completion: { _ in
            self.animateView.removeFromSuperview()
        }
    }
    
    private func srtupAction() {
        animateView.hideButton.addTarget(self, action: #selector(tapActionButton), for: .touchUpInside)
    }
    
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifaer, for: indexPath) as! PhotosTableViewCell
            cell.nextButton.addTarget(self, action: #selector(goToPhotoGalery), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifaer, for: indexPath) as! PostTableViewCell
            cell.setupCell(post: post[indexPath.row-1])
            return cell
        }
    }
        
    @objc func goToPhotoGalery() {
          let photoScreen = PhotosViewController()
          navigationController?.pushViewController(photoScreen, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        post.count+1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ProfileHeaderView(reuseIdentifier: ProfileHeaderView.identifaer)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapActionAvatar))
        view.avatarImageView.isUserInteractionEnabled = true
        view.avatarImageView.addGestureRecognizer(tapGesture)
        return view
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
