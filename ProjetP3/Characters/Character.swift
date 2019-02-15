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

    func attack(hero: Character, enemy: Character){
        enemy.health = enemy.health - hero.weapon.damage
        print("\(hero.characterName) attack \(enemy.characterName) with the \(hero.weapon.weaponName)")
        print("-\(hero.weapon.power)")
        print("\(hero.characterName)'s health is \(enemy.health) PV now")
    }
    
    func checkHealth(character: Character) -> Int{
        var i = 1
        if character.health<=0{
            print("\(character.characterName) is dead")
            i = 0
        }
        return i
    }
}
