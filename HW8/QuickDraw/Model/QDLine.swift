//
//  Line.swift
//  QuickDraw
//
//  Created by CSC214 Instructor on 8/8/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import UIKit

class QDLine: Equatable, Codable {
    
    static func == (lhs: QDLine, rhs: QDLine) -> Bool {
        return lhs.points == rhs.points
    }
    
    var points = [CGPoint]()

    convenience init(startingPoint: CGPoint) {
        self.init()
        self.points.append(startingPoint)
    }

    func addPoint(_ point: CGPoint) {
        points.append(point)
    }
}
