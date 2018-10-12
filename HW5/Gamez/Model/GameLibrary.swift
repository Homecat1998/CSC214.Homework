//
//  GameLibrary.swift
//  Gamez
//
//  Created by CSC214 Instructor on 7/27/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

class GameLibrary {
    
    var games = [Game]()

    func addGame(_ title: String, _ genreType: GenreType, _ releaseYear: Int, _ rating: Int) {
        let game = Game(title: title, genreType: genreType, releaseYear: releaseYear, rating: rating)
        games.append(game)
    }

    func games(for genreType: GenreType) -> [Game] {

        var genreGames = [Game]()
        for game in games {
            if game.genreType == genreType {
                genreGames.append(game)
            }
        }
        return genreGames
    }

}
