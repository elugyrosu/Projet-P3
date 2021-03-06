//
//  Weapons.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 02/02/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Weapon { // all weapons properties
    let weaponName: String
    let damage: Int
    let power: Int          //only for Magus, used for treat
    
    init (damage: Int, weaponName: String, power: Int){
        self.damage = damage
        self.weaponName = weaponName
        self.power = power
    }
}
