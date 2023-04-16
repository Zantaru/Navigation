//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Антон Зудинов on 13.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    public var correct: CGFloat = 0
    public let insert:CGFloat = 16
    public let avatarInsert:CGFloat = 64
    private var post = Post.makePostsArray()
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
        setupAction()
    }
    
    private func setupAction() {
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
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapLike))
            let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
            tapGesture.delegate = self
            imageTapGesture.delegate = self
            cell.image.isUserInteractionEnabled = true
            cell.image.addGestureRecognizer(imageTapGesture)
            cell.likes.isUserInteractionEnabled = true
            cell.likes.addGestureRecognizer(tapGesture)
            return cell
        }
    }
    
    @objc func tapImage(recognizer: UITapGestureRecognizer){
        if recognizer.state == UIGestureRecognizer.State.ended {
            let tapLocation = recognizer.location(in: self.tableView)
            if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
                if self.tableView.cellForRow(at: tapIndexPath) is PostTableViewCell {
                    let postVC = CellViewController()
                    if post[tapIndexPath.row-1].isView == false {
                        post[tapIndexPath.row-1].views += 1
                        post[tapIndexPath.row-1].isView = true
                        self.tableView.reloadData()
                    }
                    postVC.postView.setupCell(post: post[tapIndexPath.row-1])
                    present(postVC, animated: true)
                   }
                }
            }
        }
        
    @objc func tapLike(recognizer: UITapGestureRecognizer)  {
          if recognizer.state == UIGestureRecognizer.State.ended {
              let tapLocation = recognizer.location(in: self.tableView)
              if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
                  if self.tableView.cellForRow(at: tapIndexPath) is PostTableViewCell {
                      if post[tapIndexPath.row-1].isLikeTapet {
                         post[tapIndexPath.row-1].isLikeTapet = false
                         post[tapIndexPath.row-1].likes -= 1
                         self.tableView.reloadData()
                     } else {
                         post[tapIndexPath.row-1].isLikeTapet = true
                         post[tapIndexPath.row-1].likes += 1
                         self.tableView.reloadData()
                     }
                  }
              }
          }
      }
     
     @objc private func tapActionAvatar() {
         if tableView.contentOffset.y + view.safeAreaLayoutGuide.layoutFrame.origin.y < 22 {
             correct = (tableView.contentOffset.y + view.safeAreaLayoutGuide.layoutFrame.origin.y)
         } else {
             correct = 22
         }
         view.addSubview(animateView)
   
         NSLayoutConstraint.activate([
             animateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             animateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             animateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             animateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         ])
         animateView.topConstraint.constant = avatarInsert-26-self.correct
         animateView.topAvatarHideConstraint.constant = avatarInsert-26-self.correct
         
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
                 self.animateView.leadigConstraint.constant = self.insert
                 self.animateView.topConstraint.constant = (self.avatarInsert-26-self.correct)
                 self.animateView.widthConstraint.constant = 120
                 self.animateView.heightConstraint.constant = 120
                 self.animateView.avatarImageView.layer.cornerRadius = 60
                 self.animateView.hideView.alpha = 0
                 self.animateView.layoutIfNeeded()
             } completion: { _ in
                 self.animateView.removeFromSuperview()
             }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.row != 0{
            self.post.remove(at: indexPath.row-1)
            self.tableView.reloadData()
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
