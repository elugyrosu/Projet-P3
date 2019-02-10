//
//  Game.swift
//  ProjetP3
//
//  Created by Jordan MOREAU on 30/01/2019.
//  Copyright © 2019 Jordan MOREAU. All rights reserved.
//

import Foundation //menu etat

class Game {
    
    func mainMenu() {
        print("===============================")
        print("Welcome to Dot Fantasy")
        print("===============================")

    }
    func start(){
        let gameTeams = TeamFactory()
        gameTeams.createTeams()
        gameTeams.showAllStats()
    }
    
    func teamAttack(){
        print("choose the hero you want to use")

            
    }

        
        
    
    
    

}
    
//    func teamOneAttack(){
//        print("")
//        print("===============================")
//        print("\(teamOne.teamName), who do you want to use ?")
//        
//        print("1 - \(newGame.teamOne.characters[0].characterName), type: \(newGame.teamOne.characters[0].characterType), health: \(newGame.teamOne.characters[0].health) PV, Weapon: \(newGame.teamOne.characters[0].weapon.weaponName), Dammage: \(newGame.teamOne.characters[0].weapon.damage)")
//        print("2 - \(newGame.teamOne.characters[1].characterName), type: \(newGame.teamOne.characters[1].characterType), health: \(newGame.teamOne.characters[1].health) PV, Weapon: \(newGame.teamOne.characters[1].weapon.weaponName), Dammage: \(newGame.teamOne.characters[1].weapon.damage)")
//        print("3 - \(newGame.teamOne.characters[2].characterName), type: \(newGame.teamOne.characters[2].characterType), health: \(newGame.teamOne.characters[2].health) PV, Weapon: \(newGame.teamOne.characters[2].weapon.weaponName), Dammage: \(newGame.teamOne.characters[2].weapon.damage)")
//        
//        print("\(teamOne.teamName), who do you want to attack ?")
//        
//        print("1 - \(newGame.teamTwo.characters[0].characterName), type: \(newGame.teamTwo.characters[0].characterType), health: \(newGame.teamTwo.characters[0].health) PV, Weapon: \(newGame.teamTwo.characters[0].weapon.weaponName), Dammage: \(newGame.teamTwo.characters[0].weapon.damage)")
//        print("2 - \(newGame.teamTwo.characters[1].characterName), type: \(newGame.teamTwo.characters[1].characterType), health: \(newGame.teamTwo.characters[1].health) PV, Weapon: \(newGame.teamTwo.characters[1].weapon.weaponName), Dammage: \(newGame.teamTwo.characters[1].weapon.damage)")
//        print("3 - \(newGame.teamTwo.characters[2].characterName), type: \(newGame.teamTwo.characters[2].characterType), health: \(newGame.teamTwo.characters[2].health) PV, Weapon: \(newGame.teamTwo.characters[2].weapon.weaponName), Dammage: \(newGame.teamTwo.characters[2].weapon.damage)")
//        
//    }
//    
//    func teamTwoAttack(){
//        print("")
//        print("===============================")
//        print("\(teamTwo.teamName), who do you want to use ?")
//        
//        print("1 - \(newGame.teamTwo.characters[0].characterName), type: \(newGame.teamTwo.characters[0].characterType), health: \(newGame.teamTwo.characters[0].health) PV, Weapon: \(newGame.teamTwo.characters[0].weapon.weaponName), Dammage: \(newGame.teamTwo.characters[0].weapon.damage)")
//        print("2 - \(newGame.teamTwo.characters[1].characterName), type: \(newGame.teamTwo.characters[1].characterType), health: \(newGame.teamTwo.characters[1].health) PV, Weapon: \(newGame.teamTwo.characters[1].weapon.weaponName), Dammage: \(newGame.teamTwo.characters[1].weapon.damage)")
//        print("3 - \(newGame.teamTwo.characters[2].characterName), type: \(newGame.teamTwo.characters[2].characterType), health: \(newGame.teamTwo.characters[2].health) PV, Weapon: \(newGame.teamTwo.characters[2].weapon.weaponName), Dammage: \(newGame.teamTwo.characters[2].weapon.damage)")
//        
//        print("\(teamTwo.teamName), who do you want to attack ?")
//        
//        print("1 - \(newGame.teamOne.characters[0].characterName), type: \(newGame.teamOne.characters[0].characterType), health: \(newGame.teamOne.characters[0].health) PV, Weapon: \(newGame.teamOne.characters[0].weapon.weaponName), Dammage: \(newGame.teamOne.characters[0].weapon.damage)")
//        print("2 - \(newGame.teamOne.characters[1].characterName), type: \(newGame.teamOne.characters[1].characterType), health: \(newGame.teamOne.characters[1].health) PV, Weapon: \(newGame.teamOne.characters[1].weapon.weaponName), Dammage: \(newGame.teamOne.characters[1].weapon.damage)")
//        print("3 - \(newGame.teamOne.characters[2].characterName), type: \(newGame.teamOne.characters[2].characterType), health: \(newGame.teamOne.characters[2].health) PV, Weapon: \(newGame.teamOne.characters[2].weapon.weaponName), Dammage: \(newGame.teamOne.characters[2].weapon.damage)") 
//        
//    }

