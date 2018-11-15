//

//   TableViewController.swift
//   QuickDraw
//
//  Created by: CSC214 Instructor on 11/14/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var draws : Draws!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading")
        if draws.draws.count == 0 {
            let newDraw = QDDocument(title: "Untitled1")
            draws.draws.append(newDraw)
        }
        print(draws.draws.count)
        insertAndSelectDocumentZero()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"{
            if let detailViewController = segue.destination as? ViewController{
                if let indexPath = tableView.indexPathForSelectedRow {
                    detailViewController.document = draws.draws[indexPath.row]
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(draws.draws.count)
        return draws.draws.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrawCell", for: indexPath)
        cell.textLabel?.text = draws.draws[indexPath.row].title

        return cell
    }
    
    @IBAction func onAddBtn(_ sender: Any) {
        let nextFile = "Untitled\(draws.draws.count + 1)"
        let newDraw = QDDocument(title: nextFile)
        draws.draws.append(newDraw)
        tableView.reloadData()
    }

    @IBAction func toggleEdit(_ sender: Any) {
        setEditing(!isEditing, animated: true)
    }
    
    // swipe disabled
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return (tableView.isEditing) ? .delete : .none
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if draws.draws.count > 1 {
            if let item = draws?.draws[indexPath.row]{
                deletionAlert(completion: { _ in
                    self.draws?.removeItem(item)
                    self.tableView.reloadData()
                })
            }
        }

    }
    
    // move
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return proposedDestinationIndexPath
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        draws?.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Deletion Alert
    
    func deletionAlert(completion: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: NSLocalizedString("str_warning", comment: ""),
                                      message: nil,
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
    
    
    func insertAndSelectDocumentZero(){
        
        let nextFile = "Untitled\(draws.draws.count + 1)"
        let newDraw = QDDocument(title: nextFile)
        draws.draws.append(newDraw)
        tableView.reloadData()
        self.performSegue(withIdentifier: "DetailViewSegue", sender: self)
        
    }

}
