//
//  PostStucure.swift
//  Navigation
//
//  Created by Антон Зудинов on 24.02.2023.
//

import UIKit

struct Post {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
    var isLikeTapet: Bool
    var isView: Bool
    
    static func makePostsArray () -> [Post] {
        return [
        Post(author: "Dambldor", description: "Первый", image: "1", likes: 34, views: 3556, isLikeTapet: false, isView: false),
        Post(author: "Gagarin", description: "Второй", image: "2", likes: 63, views: 235, isLikeTapet: false, isView: false),
        Post(author: "FBI", description: "Третий", image: "3", likes: 236, views: 765, isLikeTapet: false, isView: false),
        Post(author: "Aliants", description: "Четвертый", image: "4", likes: 266, views: 445, isLikeTapet: false, isView: false),
        Post(author: "Superman", description: "Пятый", image: "5", likes: 76, views: 331, isLikeTapet: false, isView: false)
        ]
    }
}
