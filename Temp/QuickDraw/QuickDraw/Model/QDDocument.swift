//
//  Drawing.swift
//  QuickDraw
//
//  Created by Arthur Roolfs on 11/3/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation
import UIKit

class QDDocument: Equatable, Codable {
    
    static func == (lhs: QDDocument, rhs: QDDocument) -> Bool {
        return lhs.title == rhs.title && lhs.date == rhs.date
    }
    
    var title: String
    var date: Date
    var lines: [QDLine]
    var roundBrush: Bool
    var tint: UIColor
    
    enum CodingKeys: String, CodingKey {
        case title, date, lines, roundBrush, tint
    }

    init(title: String, date: Date, lines: [QDLine], roundBrush: Bool = true, tint: UIColor) {
        self.title = title
        self.date = date
        self.lines = lines
        
        self.roundBrush = roundBrush
        self.tint = tint
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        date = try container.decode(Date.self, forKey: .date)
        lines = try container.decode(Array.self, forKey: .lines)
        
        roundBrush = try container.decode(Bool.self, forKey: .roundBrush)
        
        let colorData = try container.decode(Data.self, forKey: .tint)
        tint = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor ?? UIColor.black
    }

    convenience init(title: String) {
        let lines = [QDLine]()
        self.init(title: title, date: Date(), lines: lines, roundBrush: false, tint: .black)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(title, forKey: .title)
        try container.encode(date, forKey: .date)
        try container.encode(lines, forKey: .lines)
        
        let colorData = NSKeyedArchiver.archivedData(withRootObject: tint)
        try container.encode(colorData, forKey: .tint)
        
        try container.encode(roundBrush, forKey: .roundBrush)
    }
}

































