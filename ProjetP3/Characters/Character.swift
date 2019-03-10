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
        self.healthMax = health // for treat
        self.health = health
        self.characterName = characterName
        self.characterType = characterType
        self.weapon = weapon
    }
    
    func attack(hero: Character, enemy: Character){ // result and print enemy health
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
    
    func isDeadNoPrint() -> Bool{ // just for check
        var isDead = false
        if health<=0{
            isDead = true
        }
        return isDead
    }
    
    func isDead() -> Bool{ // just for print
        if health<=0{
            print("\(characterName) is dead")
        }
        return isDeadNoPrint()
    }
}
