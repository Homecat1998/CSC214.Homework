//
//  GenreType.swift
//  Gamez
//
//  Created by CSC214 Instructor on 7/28/18.
//  Copyright © 2018 University of Rochester. All rights reserved.
//

import Foundation

enum GenreType: Int {

    case actionRPG, firstPersonShooter, jrpg, platformer, sideScroller, shooter, teamShooter, towerDefense, westernRPG
    
    static let allValues = [actionRPG, firstPersonShooter, jrpg, platformer, sideScroller, shooter, teamShooter, towerDefense, westernRPG]
    
    func name() -> String {
        switch self {
        case .actionRPG:                    return "Action RPG"
        case .firstPersonShooter:           return "First Person Shooter"
        case .jrpg:                         return "JRPG"
        case .platformer:                   return "Platformer"
        case .sideScroller:                 return "Side Scroller"
        case .shooter:                      return "Shooter"
        case .teamShooter:                  return "Team Shooter"
        case .towerDefense:                 return "Tower Defense"
        case .westernRPG:                   return "Western RPG"
        }
    }
}
