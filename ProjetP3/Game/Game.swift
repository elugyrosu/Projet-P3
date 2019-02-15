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
    
    func Battle(){
        var i = 0
//        let team = teamFactory.teams
        repeat {
            for team in teams{
                
                while teamDefeat(team: team) == false{
                    print("Team \(team.teamName)")
                    print("choose the hero you want to use")
                    let heroSelected = chooseCharacterNoPrint(team: team)
                    
                    if heroSelected.characterType.contains("Magus"){ // soin
                        if let magus = heroSelected as? Magus{
                            print("Team \(team.teamName)")
                            print("choose the hero you want to treat with the \(magus.weapon.weaponName)")
                            team.charactersStatus()
                            let heroTreat = chooseCharacterNoPrint(team: team)
                            magus.treat(magus: magus, treatedHero: heroTreat)
                        }
                    }else {
                        print("Team \(team.teamName)")
                        print("choose the ennemi you want to attack")   // rendre ça compatible pour plus de players (utiliser des modulo% ?)
                        if i == 0{
                            let teamEnemy = teamFactory.teams[i+1]                                                                            // player one
                            teamAttack(teamEnemy: teamEnemy, heroSelected: heroSelected, team: team)
                    
                        }else{
                            let teamEnemy = teamFactory.teams[i-1]
                            teamAttack(teamEnemy: teamEnemy, heroSelected: heroSelected, team: team)
                        }
                    }
                }
                
                i += 1
            }
        } while end(teams: teams) == false
    }
    
    
    
   
    func chooseCharacterNoPrint(team: Team) -> Character{
        team.charactersStatus()
        var characterSelected = team.characters[choiceIndex123()]
        while deadOrNot(character: characterSelected) == true{
            let choice = team.characters[choiceIndex123()]
            characterSelected = choice
        }
        return characterSelected
    }
    
    func teamAttack(teamEnemy: Team, heroSelected: Character, team: Team){
     
        let enemySelected = chooseCharacterNoPrint(team: teamEnemy)
        heroSelected.attack(hero: heroSelected, enemy: enemySelected)
        attackResults(teams: teams, enemy: enemySelected, teamEnemy: teamEnemy, teamPlayerName: team.teamName)
    }
    
    func deadOrNot(character: Character) -> Bool{
        var check = false
        if character.checkHealth(character: character) == 0{
            check = true
        }
        return check
    }
    func teamDefeat(team: Team) -> Bool{
        var check = false
        if team.checkAlldead(team: team) == 0 {
            print("l'équipe \(team.teamName) a perdu")
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
        if deadOrNot(character: enemy) == true{
            if teamDefeat(team: teamEnemy) == true{
                if end(teams: teams) == true{
                    winner(teamWinnerName: teamPlayerName)
                }
            }
        }
    }

}
