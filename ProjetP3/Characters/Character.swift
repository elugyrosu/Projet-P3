//
//  character.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 29/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Character {
    
    let healthMax: Int
    var health: Int
    let characterName: String
    let characterType: String
    var weapon: Weapon
    
    init(healthMax: Int, health: Int, characterName: String, characterType: String, weapon: Weapon){
        self.healthMax = health
        self.health = health
        self.characterName = characterName
        self.characterType = characterType
        self.weapon = weapon
    }

    func attack(hero: Character, enemy: Character){
        enemy.health = enemy.health - hero.weapon.damage
        if enemy.health <= 0 {
            enemy.health = 0
        }
        print("")
        print("\(characterName) attack \(enemy.characterName) with the \(hero.weapon.weaponName)")
        print("-\(hero.weapon.damage)PV")
        print("\(enemy.characterName)'s health is \(enemy.health)/\(enemy.healthMax) PV now")
        print("")
    }
    
    func isDead() -> Bool{
        if health<=0{
            print("\(characterName) is dead")
        }
        return isDeadNoPrint()
    }
    
    func isDeadNoPrint() -> Bool{
        var isDead = false
        if health<=0{
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
