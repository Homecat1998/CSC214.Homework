//
//  ViewController.swift
//  Faves
//
//  Created by Zhong, Zhetao on 10/18/18.
//  Copyright © 2018 Zhong, Zhetao. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var myMovie : Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 75
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // creating sells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier") as? MovieTableCell else {
            fatalError("Expected MediaTableCell")
        }
        
        
        if let movie = myMovie?.movies[indexPath.row] {
            cell.title?.text = movie.title
            cell.actor?.text = String(describing: movie.actor)
        } else {
            print("nil")
        }
        
        return cell
    }
    
    
    // MARK: - Add Media
    
    func addMovie(barButtonItem: UIBarButtonItem) {
        
        print("is Adding")
        
        let alert = UIAlertController(
            title: NSLocalizedString("str_selectItemToAdd", comment: ""),
            message: nil,
            preferredStyle: .actionSheet)
        
        
        let addMovieAction = UIAlertAction(title: NSLocalizedString("str_movie", comment: ""), style: .default) { _ in
            if let movie = self.myMovie?.randomMovie() {
                self.myMovie?.addMovie(movie)
                self.tableView.reloadData()
            }
        }
        
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""), style: .cancel)
        
        alert.addAction(addMovieAction)
        alert.addAction(cancelAction)
        
        alert.popoverPresentationController?.barButtonItem = barButtonItem
        
        self.present(alert, animated: true)
    }
    
    // disallow swipe deletion when not in edit mode
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return (tableView.isEditing) ? .delete : .none
    }
    
    // editing cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
            
        if editingStyle == .delete {
            
            if let movie = myMovie?.movies[indexPath.row] {
                deletionAlert(title: movie.title, completion: { _ in
                    self.myMovie?.removeMovie(movie)
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    // moving
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return sourceIndexPath
        }
        return proposedDestinationIndexPath
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        myMovie?.moveMovie(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }

    
    // MARK: - Deletion Alert
    
    func deletionAlert(title: String, completion: @escaping (UIAlertAction) -> Void) {
        
        //        let alert = UIAlertController(title: NSLocalizedString("str_warning", comment: ""),
        //                                                message: NSLocalizedString("str_cantUndoWarning", comment: ""),
        //                                                preferredStyle: .actionSheet)
        let alertMsg = NSLocalizedString("str_deleteWarning", comment: "").replacingOccurrences(of: "_", with: title)
        let alert = UIAlertController(title: NSLocalizedString("str_warning", comment: ""),
                                      message: alertMsg,
                                      preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: NSLocalizedString("str_delete", comment: ""),
                                         style: .destructive, handler: completion)
        let cancelAction = UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""),
                                         style: .cancel, handler:nil)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        /*
         **  In this case we need a source for the popover as well, but don't have a handy UIBarButtonItem.
         **  As alternative we therefore use the sourceView/sourceRect combination and specify a rectangel
         **  centered in the view of our viewController.
         */
        alert.popoverPresentationController?.permittedArrowDirections = []
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.frame.midX, y: self.view.frame.midY, width: 0, height: 0)
        
        present(alert, animated: true, completion: nil)
    }


    // MARK: - Actions
    
    @IBAction func toggleEditingMode(_ sender: Any) {
        setEditing(!isEditing, animated: true)
    }
    
    @IBAction func addItems(_ sender: UIBarButtonItem) {
        addMovie(barButtonItem: sender)
        print("adding")
    }
    





}

