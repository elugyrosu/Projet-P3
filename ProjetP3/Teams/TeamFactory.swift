//
//  TeamFactory.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 04/02/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation

class TeamFactory {
    var teams = [Team]()
    var charactersName = [String]()     //to check unique character name
    
    private func createCharacter(index: Int) -> Character? {        // a Character append after user selection
        var choice = 0
        print("")
        print("===============================")
        print("Choose character n°:\(index+1)")
        print("1 - Warrior: 100 PV - Sword - Damage: 10")
        print("2 - Colossus: 150 PV - Fist - Damage: 5")
        print("3 - Dwarf: 70 PV - Axe - Damage: 50")
        print("4 - Magus: 80 PV - Philosopher's Stone - Healing: +20 - Damage if alone: 2")
        print("===============================")
        repeat {                // user Selection
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4
        
        switch choice {
        case 1:
            warriorSelected() // prints
            let warrior = Warrior(name: uniqueCharacterName()) // selection append
            return warrior
        case 2:
            colossusSelected()
            return Colossus(name: uniqueCharacterName())
        case 3:
            dwarfSelected()
            return Dwarf(name: uniqueCharacterName())
        case 4:
            magusSelected()
            return Magus(name: uniqueCharacterName())
        default:
            print("An error occured, the character couldn't be created")
            return nil
        }
    }
    
    private func uniqueCharacterName() -> String { // check the selection in charactersName array and repeat in a loop
        print("")
        print("===============================")
        print("who is he or she or it (maybe not a binary genre) ?")
        var name = ""
        repeat {
            print("Gimme a name:")
            if let data: String = readLine() {
                name = data
            }
            if charactersName.contains(name){
                print("")
                print("a Hero already have this name")
                name = ""
            }
        }while name == ""
        return name
    }
    
    private func createCharacters() -> [Character] { // fill the array of characters
        var characters = [Character]()
        
        for i in 0..<3 { // number of heros optimised for 3
            guard let character = createCharacter(index: i) else { return characters }
            characters.append(character)
            charactersName.append(character.characterName)
        }
        return characters
    }
    
    private func createTeam() -> Team{ // = a teamName and an array of characters
        let team = Team(name: uniqueTeamName())
        print("===============================")
        print("")
        print("Team \(team.teamName), you will choose 3 characters:")
        team.characters = createCharacters()
        return team
    }
    
    private func uniqueTeamName() -> String { // check the selection and repeat in a loop
        var name = ""
        repeat {
            print("")
            print("enter your team name:")
            if let data = readLine(){
                name = data
            }
            for team in teams {   // check tous les noms rentrés
                if team.teamName.contains(name){
                    print("a team already has this name, you have to change it right now !")
                    name = ""
                }
            }
        }while name == ""
        return name
    }
    
    func createTeams() { // fill the array of teams - optimised fot 2 teams
        for i in 0..<2 {
            print("")
            print("===============================")
            print("Player \(i+1)")
            let team = createTeam()
            teams.append(team)
        }
        showAllStats()
    }
    
    private func warriorSelected(){
        print("")
        print("===============================")
        print("You have a brand new Warrior now")
    }
    
    private func dwarfSelected() {
        print("")
        print("===============================")
        print("Did you choose the dwarf or the axe ?")
    }
    
    private func colossusSelected() {
        print("")
        print("===============================")
        print("What a giant ! Good choice but he doesn't know how to fight, I think.")
    }
    
    private func magusSelected() {
        print("")
        print("===============================")
        print("So... you choosed a very old and very heary thing, wearing a purple robe and a purple hat bigger than me ?")
    }
    
    func isEnd() -> Bool{ // check if there is more than one active team  to battle
        var checkAllteams = false
        var i = 0
        for team in teams{
            if team.isTeamDead() == false{
                i += 1
            }
        }
        if i <= 1{
            checkAllteams = true
        }
        return checkAllteams
    }
    
    private func showAllStats() { // Print all teams characters Status
        print("")
        print("===============================")
        print("All characters status")
        print("===============================")
        print("")
        for team in teams {
            print("\(team.teamName)'s characters status:")
            print("")
            team.charactersStatus()
            print("")
        }
        print("===============================")
    }
}












