//
//  philosopher's Stone.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 02/02/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class PhilospoherStone: Weapon {
    var healing = 20
    init() {
        super.init(damage: 0, weaponName: "Philosopher's stone")
    }
}
