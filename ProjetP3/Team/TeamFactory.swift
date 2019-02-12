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
    
    private func createCharacter(index: Int) -> Character? {
        var choice = 0
        print("")
        print("===============================")
        print("Choose character n°:\(index+1)")
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
            return Warrior(name: uniqueCharacterName())
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
            return nil
        }
    }
    private func createCharacters() -> [Character] {
        var characters = [Character]()
        
        for i in 0..<3 {
            guard let character = createCharacter(index: i) else { return characters }
            characters.append(character)
        }
        
        return characters
    }
    private func createTeam() -> Team{
        let team = Team(name: uniqueTeamName())
        print("===============================")
        print("Team \(team.teamName), you will choose 3 characters,")
        team.characters = createCharacters()
        return team
    }
    func createTeams() {
        for i in 0..<2 {
            print("")
            print("===============================")
            print("Player \(i+1)")
            let team = createTeam()
            teams.append(team)
        }
        showAllStats()
    }
    private func uniqueTeamName() -> String {
        var name = ""
        repeat {
            print("")
            print("enter your team name:")
            if let data = readLine(){
                name = data
            }
            for Team in teams {   // check tous les noms rentrés
                if Team.teamName.contains(name){
                print("a team already has this name, you have to change it right now !")
                name = ""
                }
            }
        }while name == ""
        return name
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
    private func uniqueCharacterName() -> String {
        var name = ""
        repeat {
            print("")
            print("===============================")
            print("who is he or she or it (maybe not a binary genre) ?")
            print("Gimme a name:")
            if let data: String = readLine() {
                name = data
            }
            for team in teams{
                if team.checkNames(name: name) == true{
                    name = ""
                }
            }
        } while name == ""
        return name
    }

    
   private func showAllStats() {
        print("")
        print("===============================")
        print("All characters status")
        print("===============================")
        print("")
        for team in teams {
            print("\(team.teamName)'s characters stats:")
            print("")
            team.charactersStatus()
            print("")
        } // inserer characterStatus()
            print("===============================")
    }
}
    
  
    
    
    
    
    
    
    
    


