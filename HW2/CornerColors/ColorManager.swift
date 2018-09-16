//
//  ColorManager.swift
//  CornerColors
//
//  Created by Zhong, Zhetao on 9/16/18.
//  Copyright © 2018 Zhong, Zhetao. All rights reserved.
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
