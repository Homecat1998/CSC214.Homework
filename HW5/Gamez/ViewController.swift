//
//  ViewController.swift
//  Gamez
//
//  Created by CSC214 Instructor on 7/27/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var library: GameLibrary!

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        **  Fixing the statusbar underlap issue with UIEdgeInsets - iOS < 11
        */
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height

        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = 64
    }
    
    override var prefersStatusBarHidden: Bool { return false }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return GenreType.allValues.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let type = GenreType(rawValue: section) {
            return library.games(for: type).count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let type = GenreType(rawValue: section) {
            return type.name()
        }
        return nil
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTableCell") as? MediaTableCell else {
            fatalError("Expected UITableViewCell")
        }
        


        if let type = GenreType(rawValue: indexPath.section) {
            
            
            var genreGames = library.games(for: type)
            let game = genreGames[indexPath.row]
            cell.title?.text = game.title
            cell.releaseDate?.text = game.releaseYear.description
            let rating = game.rating
            if rating == 1{
                cell.ratingImage?.image = UIImage(named: "stars_01")
            } else if (rating == 2){
                cell.ratingImage?.image = UIImage(named: "stars_02")
            } else if (rating == 3){
                cell.ratingImage?.image = UIImage(named: "stars_03")
            }
            
        }
        return cell
    }

}

