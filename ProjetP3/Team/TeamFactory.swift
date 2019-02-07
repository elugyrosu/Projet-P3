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
        var i = 0
        for _ in 0...1 {
            print("Player \(i+1)")
            let team = Team(name: uniqueTeamName())
            teams.append(team)
            team.createTeam()
            i += 1
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
            print("===============================")
        }
            
    }
    
  
}

