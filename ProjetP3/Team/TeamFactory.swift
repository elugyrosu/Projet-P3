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
    
    func createTeams() {
        
        for i in 0...1 {
            print("Player \(i+1)")
            let team = Team(name: uniqueTeamName())
            teams.append(team)
            print("===============================")
            print("Team \(teams[i].teamName), you will choose 3 characters,")
            
            for j in 0...2{
                
                var choice = 0
                
                print("")
                print("===============================")
                print("Choose character n°:\(j+1)")
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
                    team.characters.append(warrior)
                    
                case 2:
                    colossusSelected()
                    let colossus = Colossus(name: uniqueCharacterName())
                    team.characters.append(colossus)
                    
                case 3:
                    dwarfSelected()
                    let dwarf = Dwarf(name: uniqueCharacterName())
                    team.characters.append(dwarf)
                    
                case 4:
                    magusSelected()
                    let magus = Magus(name: uniqueCharacterName())
                    team.characters.append(magus)
                    
                default:
                    break
                }
            }
            
          
        }

    }
    
    
    func uniqueTeamName() -> String {
        
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
            
            for Team in teams
            {
                if Team.checkNames(name: name) == true{
                    name = ""
                }
            }
        } while name == ""
        return name
    }

    
    func showAllStats() { 
        print("")
        print("===============================")
        print("All characters status")
        print("===============================")
        print("")
        
        for Team in teams {
            print("\(Team.teamName)'s characters stats")
            print("")
            Team.charactersStatus()
        } // inserer characterStatus()
            print("===============================")
    }
            
}
    
  
    
    
    
    
    
    
    
    


