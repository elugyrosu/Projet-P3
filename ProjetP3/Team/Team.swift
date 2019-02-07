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

    func chooseCharacter(){
        var choice = 0
        
        print("")
        print("===============================")
        print("Choose a character")
        print("1 - Warrior: 100 PV - Sword - Dammage: 10")
        print("2 - Colossus: 150 PV - Fist - Dammage: 5")
        print("3 - Dwarf: 70 PV - Axe - Dammage: 50")
        print("4 - Magus: 80 PV - Philosopher's Stone - Healing: +20")
        print("===============================")
       
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4
        
        switch choice {
            case 1:
                warriorSelected()
                let warrior = Warrior(name: uniqueCharacterName())
                characters.append(warrior)
            
            case 2:
                colossusSelected()
                let colossus = Colossus(name: uniqueCharacterName())
                characters.append(colossus)
            
            case 3:
                dwarfSelected()
                let dwarf = Dwarf(name: uniqueCharacterName())
                characters.append(dwarf)
            
            case 4:
                magusSelected()
                let magus = Magus(name: uniqueCharacterName())
                characters.append(magus)
            
            default:
                break
        }
        
    }
    
    func warriorSelected(){
        print("")
        print("===============================")
        print("You have a brand new Warrior now")
    }
    func dwarfSelected() {
        print("")
        print("===============================")
        print("Did you choose the dwarf or the axe ?")
    }
    func colossusSelected() {
        print("")
        print("===============================")
        print("What a giant ! Good choice but he doesn't know how to fight, I think.")
    }
    func magusSelected() {
        print("")
        print("===============================")
        print("So... you choosed a very old and very heary thing, wearing a purple robe and a purple hat bigger than me ?")
    }

    func createTeam(){
            
            print("===============================")
            print("\(teamName), you'll have to choose 3 characters,")
            
            for _ in 0...2{
                chooseCharacter()
            }
            
    }
    
    func uniqueCharacterName() -> String {
        var name = ""
        
        repeat {
        
            print("")
            print("===============================")
            print("who is he or she or it (maybe not a binary genre) ?")
            print("Gimme a name:")

            if let data: String = readLine() {
                name = data
            }
            
            for Character in characters {   // check tous les noms rentrés
                    if Character.characterName.contains(name){
                        print("a character already has this name, you have to change it right now !")
                        name = ""
                    }
            }
        } while name == ""
      return name
    }
    
    func charactersStatus() {
        
        for i in 0..<characters.count {
            let character = characters[i]
            print("\(i+1) - \(character.characterName) (Type: \(character.characterType) - Health: \(character.health) PV - Weapon: \(character.weapon.weaponName) - Damage: \(character.weapon.damage))")
        }
    }
}
