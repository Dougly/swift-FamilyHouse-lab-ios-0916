//
//  TVShow.swift
//  FamilyHouse
//
//  Created by Douglas Galante on 10/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

enum TVShow: String {
    case familyMatters
    case fullHouse
    
    var showAsString: String {
        switch self {
        case .fullHouse:
            return "Full House"
        case .familyMatters:
            return "Family Matters"
        }
    }
}
