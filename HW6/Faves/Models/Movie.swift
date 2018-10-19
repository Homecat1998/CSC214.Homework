//
//  Movie.swift
//  Faves
//
//  Created by Zhong, Zhetao on 10/18/18.
//  Copyright © 2018 Zhong, Zhetao. All rights reserved.
//

import UIKit

class Movie: Equatable {
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title && lhs.actor == rhs.actor
    }
    
    var title: String
    var actor: String
    
    init(title: String, actor: String) {
        self.title = title
        self.actor = actor
    }
}
