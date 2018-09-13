//
//  StringManager.swift
//  Label Changer
//
//  Created by CSC214 Instructor on 7/18/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//
import UIKit

struct ColorManager {

    let colors: [UIColor]
    var index: Int

    mutating func getNextColor() -> UIColor {

        if index == colors.count {
            index = 0
        }

        let value = colors[index]
        index += 1

        return value
    }
}
