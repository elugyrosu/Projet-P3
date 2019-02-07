//
//  Weapons.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 02/02/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Weapon {
    
    let weaponName: String
    let damage: Int
    
    init (damage: Int, weaponName: String){
        self.damage = damage
        self.weaponName = weaponName
    }
}
