//
//  Passwords.swift
//  Passwords
//
//  Created by Arthur Roolfs on 11/3/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation


struct PasswordItem: Equatable, Codable {
    var description: String
    var password: String
}

class Passwords: Codable {
    
    var passwordList = [PasswordItem]()
    
    func add(description: String, password: String) {
        
        let passwordItem = PasswordItem(description: description, password: password)
        passwordList.insert(passwordItem, at: 0)
    }

    func removeItem(at index: Int) {
        if let _ = passwordList[index] as PasswordItem? {
            passwordList.remove(at: index)
        }
    }
}
