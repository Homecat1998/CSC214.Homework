//
//  ColorChangerModel.swift
//  CornerColors
//
//  Created by Zhong, Zhetao on 9/16/18.
//  Copyright © 2018 Zhong, Zhetao. All rights reserved.
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
    
    // Initialization, using index 0, 1, 2, 3
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
