//
//  team.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 29/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Team {
    
    var characters = [Character]()
    
    let teamName: String
    
    init(name: String){
        self.teamName = name
    }

    func charactersStatus() {
        
        for i in 0..<characters.count {
            let character = characters[i]
            print("\(i+1) - \(character.characterName) (Type: \(character.characterType) - Health: \(character.health) PV - Weapon: \(character.weapon.weaponName) - Damage: \(character.weapon.damage))")
        }
    }
    
    func checkNames(name: String) -> Bool{
        var check = false
        for character in characters{   // check tous les noms rentrés
            if character.characterName.contains(name){
                print("a character already has this name, you have to change it right now !")
                check = true
            }
        }
     return check
    }
        
}
