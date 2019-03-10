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
    
    func charactersStatus() { // only print the characters Status of the team
        print("")
        for i in 0..<characters.count {
            let character = characters[i]
            if character.isDeadNoPrint(){
                print("\(i+1) - [DEAD] \(character.characterName) [DEAD]")
            }else{
                print("\(i+1) - \(character.characterName) (Type: \(character.characterType) - Health: \(character.health)/\(character.healthMax)PV - Weapon: \(character.weapon.weaponName) - Damage: \(character.weapon.damage) - power: \(character.weapon.power)")
            }
        }
    }
    
    func isCharacterAlone() -> Bool{ // just for the Magus
        var check = false
        var i = 0
        for character in characters{
            if character.isDeadNoPrint() == false{
                i += 1
            }
        }
        if i == 1 {
            check = true
        }
        return check
    }
    
    func isTeamDead() -> Bool{ // check if the team can play or not
        for character in characters{
            if character.isDeadNoPrint() == false{
                return false
            }
        }
        return true
    }
}
