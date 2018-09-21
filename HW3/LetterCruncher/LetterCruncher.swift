//
//  LetterCruncher.swift
//  LetterCruncher
//
//  Created by: CSC214 Instructor on 9/16/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import UIKit

class LetterCruncher {
    
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var alphaDigits = ["ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"]
    let maxDigits = 7
    var index_loop = 1;

    init() {
        
        // To do:
        // generate alphaDigits array from alphabet string
    }
    
    /*
     ** NOTE: On those old phones the numbers 0 and one were not mapped to any keys.
     ** We compensate by adding 2 in our return.
     */
    func digitStringForLetter(_ letter: String) -> String? {
        for (i, letters) in alphaDigits.enumerated() {
            if nil != letters.range(of: letter, options: .caseInsensitive) {
                return String(describing: i + 2)
            }
        }
        return nil
    }
    
    func isValidInput(inputString: String, characterCount: Int) -> Bool {
        if characterCount < maxDigits {
            
            return true
                
            }
        
        return false
    }


        


    
    func makeDigitsString(inputString: String) -> String? {
        var outputString = String()
        for char in inputString {
            if let digit = digitStringForLetter(String(char)) {
                outputString.append(digit)
            }
        }
        return outputString.count > 0 ? outputString : nil
    }
}

