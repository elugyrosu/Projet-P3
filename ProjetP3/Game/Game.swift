//
//  Game.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 30/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class Game {
    let teamFactory = TeamFactory()
    var teams = [Team]()
    var roundCount = 0
    var startCounter: Date?
    
    func showTimer(startBattleDate: Date) -> String{
        let interval = Date().timeIntervalSince(startBattleDate as Date)
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        guard let timer = formatter.string(from: interval) else {
            return ""
        }
        return timer
    }
    func start(){
        print("===============================")
        print("Welcome to Dot Fantasy")
        print("===============================")
        teamFactory.createTeams()
        teams = teamFactory.teams
        battle()
    }
    func battle(){
        startCounter = Date()
        repeat {
            roundCount += 1
            for i in 0..<teams.count{   
                let team = teams[i]
                if team.isTeamDefeat() == false{           // check if team can play, else go to team after
                    teamNamePrint(team: team)
                    print("choose the HERO you want to USE:")               // choose Character to use
                    print("")
                    let heroSelected = chooseCharacter(team: team)
                    randomTreasure(heroSelected: heroSelected)
                    
                    if let magus = heroSelected as? Magus{                     // if character selected is a Magus you can treat all characters of your team who are not dead
                        if team.isCharacterAlone() == false{
                            teamNamePrint(team: team)
                            print("choose the HERO you want to TREAT with the \(magus.weapon.weaponName):")
                            print("")
                            let heroTreat = chooseCharacter(team: team)
                            magus.treat(treatedHero: heroTreat)
                        }else{
                            chooseEnemy(team: team, heroSelected: heroSelected, index: i)  // if Magus is alone, he can just attack with his specific weapon (battle balance, in case of 1 Magus vs 1 Magus)}
                        }
                    }else {
                        chooseEnemy(team: team, heroSelected: heroSelected, index: i)   // if Character is other type: Attack
                    }
                }
            }
        } while teamFactory.isEnd() == false // 1 team = end of the battle
    }
    func choiceIndex123() -> Int{     // user character choice (Characters selections)
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
    func chooseCharacter(team: Team) -> Character{
        team.charactersStatus()                                 // Just prints with stats and DEAD
        var characterSelected = team.characters[choiceIndex123()]   //first selection
        while characterSelected.isDead() == true{           // check if the Character can be used (no selection, attack or treat if dead)
            let choice = team.characters[choiceIndex123()]  //selection if dead
            characterSelected = choice
        }
        return characterSelected
    }
    func teamAttack(teamEnemy: Team, heroSelected: Character, team: Team){ // choise enemy, attack, results and checks
        let enemySelected = chooseCharacter(team: teamEnemy)
        heroSelected.attack(hero: heroSelected, enemy: enemySelected)
        attackResults(teams: teamFactory, enemy: enemySelected, teamEnemy: teamEnemy, teamPlayerName: team.teamName)
    }
   func teamNamePrint(team: Team){
        print("")
        print("===============================")
        print("Team \(team.teamName)")
        print("===============================")
    }
    func attackResults(teams: TeamFactory, enemy: Character, teamEnemy: Team, teamPlayerName: String){      //check and print: enemy dead, team defeat and winner
        if enemy.isDead() == true{
            if teamEnemy.isTeamDefeat() == true{
                if teams.isEnd() == true{
                    print("Congratulation \(teamPlayerName) win the party in \(roundCount) rounds !")
                    guard let startCounter = startCounter else {return}
                    print("game duration: " + showTimer(startBattleDate: startCounter))
                }
            }
        }
    }
    func chooseEnemy(team: Team, heroSelected: Character, index: Int){                                     // function directly created in Battle() to improve visibility (to much properties)
        teamNamePrint(team: team)                           // improved for a two player Game, need to be change on a team selection interface if more players
        print("choose the ENEMY you want to ATTACK")
        print("")
        if index == 0{
            let teamEnemy = teamFactory.teams[index+1]
            teamAttack(teamEnemy: teamEnemy, heroSelected: heroSelected, team: team)
        }else{
            let teamEnemy = teamFactory.teams[index-1]
            teamAttack(teamEnemy: teamEnemy, heroSelected: heroSelected, team: team)
        }
    }
    func randomTreasure(heroSelected: Character) { // random appear chest, scepter for magus, random weapon attack for others
        let treasure = Int.random(in: 0...100)  // chest appear 1/5 time, better than Bool.random()    older form: let treasure = arc4random_uniform(100)
        if treasure <= 20 {
            print("Surprise ! a chest appear")
            if let magus = heroSelected as? Magus{
                magus.weapon = MerlinScepter()
                print("\(heroSelected.characterName) get the \(heroSelected.weapon.weaponName)")
                print("You can treat your friends and give \(heroSelected.weapon.power)PV and if you are alone you can attack with \(heroSelected.weapon.damage)PV damage now !")
            }else{
                let newWeapon = Bool.random()   // 50/50
                if newWeapon == true{
                    heroSelected.weapon = HattoriHanzoKatana()
                }else{
                    heroSelected.weapon = ThorHammer()
                }
                print("\(heroSelected.characterName) get the \(heroSelected.weapon.weaponName)")
                print("You can attack with \(heroSelected.weapon.damage)PV damage now !")
            }
        }
    }
}
