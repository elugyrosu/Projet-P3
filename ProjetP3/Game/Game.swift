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
        Battle()
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
    
    func Battle(){

        repeat {
            for i in 0..<teams.count{
                let team = teams[i]
                if team.isTeamdead() == false{
                    print("")
                    print("===============================")
                    print("Team \(team.teamName)")
                    print("===============================")
                    print("choose the HERO you want to USE:")
                    print("")
                    let heroSelected = chooseCharacterNoPrint(team: team)
                    
                    if let magus = heroSelected as? Magus{
                        print("")
                        print("===============================")
                        print("Team \(team.teamName)")
                        print("===============================")
                        print("choose the HERO you want to TREAT with the \(magus.weapon.weaponName):")
                        print("")
                        let heroTreat = chooseCharacterNoPrint(team: team)
                        magus.treat(treatedHero: heroTreat)
                    
                    }else {
                        print("")
                        print("===============================")
                        print("Team \(team.teamName)")
                        print("===============================")
                        print("choose the ENEMY you want to ATTACK")
                        print("")
                        if i == 0{
                            let teamEnemy = teamFactory.teams[i+1]    
                            teamAttack(teamEnemy: teamEnemy, heroSelected: heroSelected, team: team)
                    
                        }else{
                            let teamEnemy = teamFactory.teams[i-1]
                            teamAttack(teamEnemy: teamEnemy, heroSelected: heroSelected, team: team)
                        }
                    }
                }
            }
        } while teamFactory.checkAllteams() == false
    }
    
   
    func chooseCharacterNoPrint(team: Team) -> Character{
        team.charactersStatus()
        var characterSelected = team.characters[choiceIndex123()]
        while characterSelected.isDead() == true{
            let choice = team.characters[choiceIndex123()]
            characterSelected = choice
        }
        return characterSelected
    }
    
    func teamAttack(teamEnemy: Team, heroSelected: Character, team: Team){
     
        let enemySelected = chooseCharacterNoPrint(team: teamEnemy)
        heroSelected.attack(hero: heroSelected, enemy: enemySelected)
        attackResults(teams: teamFactory, enemy: enemySelected, teamEnemy: teamEnemy, teamPlayerName: team.teamName)
    }
    

    func attackResults(teams: TeamFactory, enemy: Character, teamEnemy: Team, teamPlayerName: String){
        if enemy.isDead() == true{
            if teamEnemy.isTeamdead() == true{
                if teams.checkAllteams() == true{
                    print("Congratulation \(teamPlayerName) win the party !")
                }
            }
        }
    }

}
