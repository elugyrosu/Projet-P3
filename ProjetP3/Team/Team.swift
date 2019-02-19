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
        print("")
        for i in 0..<characters.count {
            let character = characters[i]
            print("\(i+1) - \(character.characterName) (Type: \(character.characterType) - Health: \(character.health)/\(character.healthMax)PV - Weapon: \(character.weapon.weaponName) - Damage: \(character.weapon.damage))")
        }
    }
    
    func isTeamdead() -> Bool{
        for character in characters{
            if character.isDeadNoPrint() == false{
                return false
            }
        }
            return true
    }

}
