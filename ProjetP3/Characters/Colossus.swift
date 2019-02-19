//
//  colossus.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 29/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Colossus: Character {
    init(name: String) {
        super.init(healthMax: 150, health: 150, characterName: name, characterType: "Colossus", weapon: Fist())
    }
}
