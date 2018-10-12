//

//   Game.swift
//   Gamez
//
//  Created by: CSC214 Instructor on 10/6/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

class Game {
    
    var title: String
    var genreType: GenreType
    var releaseYear: Int
    var rating: Int
    
    // designated initializer
    init(title: String, genreType: GenreType, releaseYear: Int, rating: Int) {
        
        self.title = title
        self.genreType = genreType
        self.releaseYear = releaseYear
        self.rating = rating
    }
    
    // convenience initializer
    convenience init(title: String, genreType: GenreType, releaseYear: Int) {
        self.init(title: title, genreType: genreType, releaseYear: releaseYear, rating: 0)
    }
}

