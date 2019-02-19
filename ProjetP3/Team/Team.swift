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
    
//    func checkNames(name: String) -> String{
//        var nameChecked = name
//        for character in characters{   // check tous les noms rentrés
//            if character.characterName.contains(name){
//                print("a hero already have this name, you have to change it right now:")
//                nameChecked = ""
//            }
//        }
//     return nameChecked
//    }
    
    func isTeamdead() -> Bool{
        var isAllDead = false
        for character in characters{
            if character.isDead() == true{
                print("l'équipe \(teamName) a perdu")
                isAllDead = true
                
            }else{
                return false
            }
        }
        return isAllDead
    }

}
