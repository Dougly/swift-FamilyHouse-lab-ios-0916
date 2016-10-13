//
//  Character.swift
//  FamilyHouse
//
//  Created by Douglas Galante on 10/12/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class Character {
    let name: String
    let castMemberOf: TVShow
    let headShot: UIImage
    
    init (name: String, castMemberOf: TVShow, headShot: UIImage) {
        self.name = name
        self.castMemberOf = castMemberOf
        self.headShot = headShot
    
    }
    
}

