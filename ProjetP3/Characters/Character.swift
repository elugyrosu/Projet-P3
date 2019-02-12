//
//  character.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 29/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Character {
    
    var health: Int
    let characterName: String
    let characterType: String
    var weapon: Weapon
    
    init(health: Int, characterName: String, characterType: String, weapon: Weapon){
        self.health = health
        self.characterName = characterName
        self.characterType = characterType
        self.weapon = weapon
    }
    // func attaquer(ennemy: Character) {
//    character1.attack()
    func attack(enemy: Character){
        enemy.health = enemy.health - weapon.damage
    }
}
