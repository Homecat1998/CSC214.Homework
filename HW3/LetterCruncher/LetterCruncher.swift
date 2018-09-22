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
    var alphaDigits = [String]()
    

    
    
    
    
    let maxDigits = 7
    var index_loop = 1;

    init() {
        
        // search function
        func search(_ input: String, from: String, to: String) -> String? {
            
            if let startIndex1 = input.range(of: from)?.upperBound,
                let startIndex2 = input.range(of: to)?.lowerBound {
                let substring = input[startIndex1..<startIndex2]
                
                return String (substring)
            }
            
            return nil
        }
        
        // 2 indexes to help solve the situation that we can not use search simply
        let W = alphabet.index(alphabet.endIndex, offsetBy: -4)
        let C = alphabet.index(alphabet.startIndex, offsetBy: 2)
        
        // make slices
        let slice1 = String(alphabet[...C])
        let slice2 = search(alphabet, from: "C", to: "G")
        let slice3 = search(alphabet, from: "F", to: "J")
        let slice4 = search(alphabet, from: "I", to: "M")
        let slice5 = search(alphabet, from: "L", to: "P")
        let slice6 = search(alphabet, from: "O", to: "T")
        let slice7 = search(alphabet, from: "S", to: "W")
        let slice8 = String(alphabet[W...])
        
        // add them to the array
        alphaDigits.append(slice1)
        alphaDigits.append(slice2!)
        alphaDigits.append(slice3!)
        alphaDigits.append(slice4!)
        alphaDigits.append(slice5!)
        alphaDigits.append(slice6!)
        alphaDigits.append(slice7!)
        alphaDigits.append(slice8)
        
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
            
            // make 2 sets of characters, then compare if the input is a part of alphabet
            let characterSet = CharacterSet(charactersIn: inputString)
            let characterSetBig = CharacterSet(charactersIn: alphabet)
            
            if characterSet.isSubset(of: characterSetBig){ return true }
            
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

