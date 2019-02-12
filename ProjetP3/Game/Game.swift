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
        for team in teams{
            print("Team \(teamFactory.teams[i].teamName)")
            print("choose the hero you want to use")
            teamFactory.teams[i].charactersStatus()
            let heroSelected = teamFactory.teams[i].characters[choiceIndex123()]
        
            if heroSelected.characterType.contains("Magus") {
                print("Team \(teamFactory.teams[i].teamName)")
                print("choose the hero you want to treat with the Philosopher's Stone")
                teamFactory.teams[i].charactersStatus()
                let heroTreat = teamFactory.teams[i].characters[choiceIndex123()]
    
            } else {
                print("Team \(teamFactory.teams[i].teamName)")
                print("choose the ennemi you want to attack")
                teamFactory.teams[i+1].charactersStatus()
                let enemySelected = teamFactory.teams[i+1].characters[choiceIndex123()]
            }
            i += 1
        }
   
    }
}
    


