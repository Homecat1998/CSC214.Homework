//
//  TableViewController.swift
//  Passwords
//
//  Created by Arthur Roolfs on 11/3/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var passwords: Passwords!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwords.passwordList.count
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        passwords.removeItem(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let dict = passwords.passwordList[indexPath.row]
        
        cell.textLabel?.text = dict.description
        
        return cell
    }

    
    // MARK: - Actions
    
    @IBAction func onAddBtn(_ sender: UIBarButtonItem) {

    }

}
