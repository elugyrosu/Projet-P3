//
//  Game.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 30/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation //menu etat

class Game {
    let teamFactory = TeamFactory()
    var teams = [Team]()
    func start(){
        print("===============================")
        print("Welcome to Dot Fantasy")
        print("===============================")
        teamFactory.createTeams()
        teams = teamFactory.teams
    }
    
    func choiceIndex123() -> Int{
        var choice = 0
        var index = 0
        
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
        } while choice != 1 && choice != 2 && choice != 3
        
        switch choice{
        case 1:
            index = 0
        case 2:
            index = 1
        case 3:
            index = 2
        default:
            break
        }
        return index
    }
    
    func teamAttack(){
        var i = 0
//        let team = teamFactory.teams
        for team in teams{
            print("Team \(team.teamName)")
            print("choose the hero you want to use")
            team.charactersStatus()
            let heroSelected = team.characters[choiceIndex123()]
        
            if heroSelected.characterType.contains("Magus"){
                if let magus = heroSelected as? Magus{
                print("Team \(team.teamName)")
                print("choose the hero you want to treat with the Philosopher's Stone")
                team.charactersStatus()
                let heroTreat = team.characters[choiceIndex123()]
                magus.treat(treatCharacter: heroTreat)
                print("\(heroSelected.characterName) treat \(heroTreat.characterName) with the \(heroSelected.weapon.weaponName)")
                print("+\(heroSelected.weapon.power)")
                print("\(heroTreat.characterName)'s health is \(heroTreat.health) PV now")
                }
            } else {
                print("Team \(team.teamName)")
                print("choose the ennemi you want to attack")
                    
                if i == 0{
                    teamFactory.teams[i+1].charactersStatus()
                    let enemySelected = teamFactory.teams[i+1].characters[choiceIndex123()]
                    heroSelected.attack(enemy: enemySelected)
                    print("\(heroSelected.characterName) attack \(enemySelected.characterName) with the \(heroSelected.weapon.weaponName)")
                    print("-\(heroSelected.weapon.power)")
                    print("\(heroSelected.characterName)'s health is \(enemySelected.health) PV now")
                }else{
                    teamFactory.teams[i-1].charactersStatus()
                    let enemySelected = teamFactory.teams[i-1].characters[choiceIndex123()]
                    heroSelected.attack(enemy: enemySelected)
                    print("\(heroSelected.characterName) attack \(enemySelected.characterName) with the \(heroSelected.weapon.weaponName)")
                    print("-\(heroSelected.weapon.power)")
                    print("\(heroSelected.characterName)'s health is \(enemySelected.health) PV now")
                }
            }
            i += 1
        }
    }
    
    func death(){
        
    }
    
}



