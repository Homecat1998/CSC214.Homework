//

//   Draws.swift
//   QuickDraw
//
//  Created by: CSC214 Instructor on 11/14/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

class Draws: Codable {

    
    var draws = [QDDocument]()
    
    var number = 0
    
    
    func addItem(_ item: QDDocument) {
        
        draws.append(item)
    }
    
    func removeItem(_ item: QDDocument) {
        if let index = draws.index(of: item) {
            draws.remove(at: index)
        }
    }
    
    func moveItem(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let item = draws[fromIndex]
            draws.remove(at: fromIndex)
            draws.insert(item, at: toIndex)
        }
    }
    
}
