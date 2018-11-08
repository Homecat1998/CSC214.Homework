//
//  DetailViewController.swift
//  Passwords
//
//  Created by Zhong, Zhetao on 11/7/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var password : PasswordItem?
    
    @IBOutlet weak var usernameLabel : UILabel!
    @IBOutlet weak var passwordLabel : UILabel!
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 0.4588, green: 0.8392, blue: 0, alpha: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        usernameLabel.text = password?.description
        passwordLabel.text = password?.password
        
    }
}
