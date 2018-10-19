//
//  Model.swift
//  Faves
//
//  Created by Zhong, Zhetao on 10/18/18.
//  Copyright © 2018 Zhong, Zhetao. All rights reserved.
//

import Foundation

class Model: NSObject {
    
    var movies: [Movie] = []
    

    
    // Creating my dictionary
    private let movieDict = ["Al Pacino": "The Godfather", "Robert Taylor": "Waterloo Bridge", "Tony Leung": "Infernal Affairs", "Kevin Spacey": "The Life of David Gale", "Humphrey Bogart": "Casablanca", "Leonardo DiCaprio": "Titanic", "YMakoto Shinkai": "Your Name"]
    
    // Create arrays for keys and values, getting them from the dict.
    private let keys = ["Al Pacino", "Robert Taylor", "Tony Leung", "Kevin Spacey", "Humphrey Bogart", "Leonardo DiCaprio", "YMakoto Shinkai"]
    
    override init() {
        super.init()
        for _ in 0..<4 {
            self.addMovie(randomMovie())
        }
    }
    
    @discardableResult
    // funcs for add, remove, move and random
    func addMovie(_ movie: Movie) -> Int {
        movies.append(movie)
        return movies.index(of: movie)!
    }
    func removeMovie(_ movie: Movie) {
        if let index = movies.index(of: movie) {
            movies.remove(at: index)
        }
    }
    func moveMovie(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let movie = movies[fromIndex]
            movies.remove(at: fromIndex)
            movies.insert(movie, at: toIndex)
        }
    }
    func randomMovie() -> Movie {
        let idx = Int(arc4random_uniform(UInt32(keys.count)))
        return Movie(title: movieDict[keys[idx]]!, actor: keys[idx])
    }
    
}
