//
//  magus.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 29/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Magus: Character {
    init(name: String) {
        super.init(health: 80, characterName: name, characterType: "Magus", weapon: PhilospoherStone())
    }
    
}
