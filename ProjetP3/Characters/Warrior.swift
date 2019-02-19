//
//  warrior.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 29/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Warrior: Character {
    init(name: String) {
        super.init(healthMax: 100, health: 100, characterName: name, characterType:"Warrior", weapon: Sword())
    }
}
