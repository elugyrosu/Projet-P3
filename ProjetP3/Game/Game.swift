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
        repeat {
            for team in teams{
            print("Team \(team.teamName)")
            print("choose the hero you want to use")
            team.charactersStatus()
            let heroSelected = team.characters[choiceIndex123()]
        
                if heroSelected.characterType.contains("Magus"){ // soin
                    if let magus = heroSelected as? Magus{
                        print("Team \(team.teamName)")
                        print("choose the hero you want to treat with the Philosopher's Stone")
                        team.charactersStatus()
                        let heroTreat = team.characters[choiceIndex123()]
                        magus.treat(magus: magus, treatedHero: heroTreat)
                }
            } else {
                print("Team \(team.teamName)")
                print("choose the ennemi you want to attack")   // rendre ça compatible pour plus de players (utiliser des modulo% ?)
                if i == 0{
                    let teamEnemy = teamFactory.teams[i+1]                                                                            // player one
                    teamEnemy.charactersStatus()
                    let enemySelected = teamEnemy.characters[choiceIndex123()]
                    heroSelected.attack(hero: heroSelected, enemy: enemySelected)
                    attackResults(teams: teams, enemy: enemySelected, teamEnemy: teamEnemy, teamPlayerName: team.teamName)
                    
                }else{
                    let teamEnemy = teamFactory.teams[i-1]
                    teamEnemy.charactersStatus()           // player two
                    let enemySelected = teamEnemy.characters[choiceIndex123()]
                    heroSelected.attack(hero: heroSelected, enemy: enemySelected)
                    attackResults(teams: teams, enemy: enemySelected, teamEnemy: teamEnemy, teamPlayerName: team.teamName)
                    }
            }
            i += 1
            }
        } while end(teams: teams) == false
    }
    
    func teamDefeat(team: Team) -> Bool{
        var check = false
        if team.checkAlldead(team: team) == 0 {
            print("l'équipe \(team.teamName) a perdu")
            check = true
        }
        return check
    }
    
    func enemyDeath(enemy: Character) -> Bool{
        var check = false
        if enemy.checkHealth(character: enemy) == 0{
            check = true
        }
        return check
    }
    
    func end(teams: [Team]) -> Bool{
        var check = false
        if teamFactory.checkAllteams(teams: teams) <= 1 {
            check = true
        }
        return check
    }
    func winner(teamWinnerName: String){
        print("Congratulation \(teamWinnerName) win the party !")
        
    }

    func attackResults(teams: [Team], enemy: Character, teamEnemy: Team, teamPlayerName: String){
        if enemyDeath(enemy: enemy) == true{
            if teamDefeat(team: teamEnemy) == true{
                if end(teams: teams) == true{
                    winner(teamWinnerName: teamPlayerName)
                }
            }
        }
    }

}
