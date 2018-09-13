//
//  LabelChangerModel.swift
//  Label Changer
//
//  Created by CSC214 Instructor on 7/18/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//
import UIKit

class ColorChangerModel {

    // Array of colors
    private static let colorsArray = [UIColor.red,
                                      UIColor.green,
                                      UIColor.blue,
                                      UIColor.brown,
                                      UIColor.cyan,
                                      UIColor.black,
                                      UIColor.orange,
                                      UIColor.purple]

    // Initialization
    var firstColors = ColorManager(colors: colorsArray, index: 0)
    var secondColors = ColorManager(colors: colorsArray, index: 1)
    var thirdColors = ColorManager(colors: colorsArray, index: 2)
    var forthColors = ColorManager(colors: colorsArray, index: 3)

    
    // funcs used to generate colors
    func getFirstColor() -> UIColor {
        return firstColors.getNextColor()
    }
    
    func getSecondColor() -> UIColor {
        return secondColors.getNextColor()
    }
    
    func getThirdColor() -> UIColor {
        return thirdColors.getNextColor()
    }
    
    func getForthColor() -> UIColor {
        return forthColors.getNextColor()
    }
}
