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

    func attack(enemy: Character){
        enemy.health = enemy.health - weapon.damage
        print("\(characterName) attack \(enemy.characterName) with the \(weapon.weaponName)")
        print("-\(weapon.power)")
        print("\(characterName)'s health is \(enemy.health) PV now")
    }
    
    func isDead() -> Bool{
        var isDead = false
        if health<=0{
            print("\(characterName) is dead")
            isDead = true
        }
        return isDead
    }
   
//
//    func isDead(character: Character) -> Int{
//        var i = 1
//        if character.health<=0{
//            print("\(character.characterName) is dead")
//            i = 0
//        }
//        return i
//    }
}
