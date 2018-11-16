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
    
    var numbers = [0]
    
    func getNextNum() -> Int {
        let tempArray = numbers.sorted()
        if let temp1 = tempArray.last{
            for i in 0...temp1 {
                if numbers.contains(i){}
                else {
                    return i
                }
            }
            return temp1 + 1
        } else {
            return -1
        }
    }
    
    
    func addItem(_ item: QDDocument) {
        
        draws.append(item)
        print("getNextNum() generates \(getNextNum())")
        numbers.append(getNextNum())
    }
    
    func removeItem(_ item: QDDocument) {
        if let index = draws.index(of: item) {
            draws.remove(at: index)
            print("removing \(numbers[index + 1])")
            numbers.remove(at: (index + 1))
        }
    }
    
    func moveItem(fromIndex: Int, toIndex: Int) {
        if fromIndex != toIndex {
            let item = draws[fromIndex]
            draws.remove(at: fromIndex)
            draws.insert(item, at: toIndex)
            let number = numbers[fromIndex + 1]
            numbers.remove(at: (fromIndex + 1))
            numbers.insert(number, at: (toIndex + 1))
        }
    }
    
}
