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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewSegue" {
            
            if let detailViewController = segue.destination as? DetailViewController  {
                
                if let indexPath = tableView.indexPathForSelectedRow {
                    detailViewController.password = passwords?.passwordList[indexPath.row]
                }
            }
        }
    }
    
    
    
    func addItemAlert() {
        
        var notEmpty1 = false
        var notEmpty2 = false
        
        let alert = UIAlertController(title: NSLocalizedString("str_prompt", comment: ""), message: nil, preferredStyle: .alert)
        let saveAction = UIAlertAction(title:NSLocalizedString("str_save", comment: ""), style: .destructive, handler: { _ in
            
            if let nameField = alert.textFields?[0], let name = nameField.text, !name.isEmpty {
                if let pwField = alert.textFields?[1], let pw = pwField.text, !pw.isEmpty {
                    self.passwords.add(description: name, password: pw)
                    self.tableView.reloadData()
                }
            }
        })
        
        alert.addTextField(configurationHandler: { (textField) in
            textField.text = ""
            saveAction.isEnabled = false
            textField.placeholder = NSLocalizedString("str_username", comment: "")
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { _ in
                notEmpty1 = !textField.text!.isEmpty
                saveAction.isEnabled = notEmpty1 && notEmpty2
            }
        })
        
        
        alert.addTextField(configurationHandler: { (textField) in
            textField.text = ""
            saveAction.isEnabled = false
            textField.placeholder = NSLocalizedString("str_password", comment: "")
            textField.isSecureTextEntry = true
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UITextFieldTextDidChange, object: textField, queue: OperationQueue.main) { _ in
                notEmpty2 = !textField.text!.isEmpty
                saveAction.isEnabled = notEmpty1 && notEmpty2
            }
        })
        
        alert.addAction(saveAction)
        alert.addAction(UIAlertAction(title: NSLocalizedString("str_cancel", comment: ""), style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(passwords.passwordList.count)
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

        addItemAlert()
    }

}
