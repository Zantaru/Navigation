//
//  PostView.swift
//  Navigation
//
//  Created by Антон Зудинов on 16.04.2023.
//

import UIKit

class PostView: UIView {
    
    private let contentViewPost: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let author: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.numberOfLines = 2
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()
    
    private let descriptionPost: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.font = UIFont.systemFont(ofSize: 14)
        view.textColor = .systemGray
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let likes: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.font = UIFont.systemFont(ofSize: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let views: UILabel = {
        let view = UILabel()
        view.backgroundColor = .white
        view.font = UIFont.systemFont(ofSize: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(post: Post) {
        image.image = UIImage(named: post.image)
        author.text = post.author
        descriptionPost.text = post.description
        likes.text = "Likes: " + String(post.likes)
        views.text = "Views: " + String(post.views)
    }
    
    private func layout() {
        self.addSubview(contentViewPost)
        [author, image, descriptionPost, likes, views].forEach { contentViewPost.addSubview($0) }
          
        let viewInsert: CGFloat = 16
        
        NSLayoutConstraint.activate([
            contentViewPost.topAnchor.constraint(equalTo: self.topAnchor),
            contentViewPost.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentViewPost.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentViewPost.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            author.topAnchor.constraint(equalTo: contentViewPost.topAnchor, constant: viewInsert),
            author.leadingAnchor.constraint(equalTo: contentViewPost.leadingAnchor, constant: viewInsert),
            author.trailingAnchor.constraint(equalTo: contentViewPost.trailingAnchor, constant: viewInsert),
            
            image.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: contentViewPost.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentViewPost.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionPost.topAnchor.constraint(equalTo: image.bottomAnchor, constant: viewInsert),
            descriptionPost.leadingAnchor.constraint(equalTo: contentViewPost.leadingAnchor, constant: viewInsert),
            descriptionPost.trailingAnchor.constraint(equalTo: contentViewPost.trailingAnchor, constant: -viewInsert),
            
            likes.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: viewInsert),
            likes.leadingAnchor.constraint(equalTo: contentViewPost.leadingAnchor, constant: viewInsert),
            
            views.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: viewInsert),
            views.trailingAnchor.constraint(equalTo: contentViewPost.trailingAnchor, constant: -viewInsert)
        ])
    }
}
