//
//  Players.swift
//  SnakeAndLadders
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import Foundation

class SnakesLadderPlayer : SnakeLadderGame {
    
    var dice : Int = 1
    
    var usersCurrentPosition : Int = 0
    
    var playerName : String?
    var game : SnakeLadderGame?
    
    init(_ name : String, game : SnakeLadderGame) {
        self.playerName = name
        self.game = game
    }

    func checkIfUserReachedAnySnakeOrLadder() {
        if let game = self.game {
            if game.snakes.contains(where: { $0.key == usersCurrentPosition }) {
                print("Player \(String(describing: self.playerName ?? "")) is bitten by snake of \(usersCurrentPosition) : \(String(describing: game.snakes[usersCurrentPosition]))" )
                usersCurrentPosition = game.snakes[usersCurrentPosition] ?? usersCurrentPosition
            } else if game.ladders.contains(where: { $0.key == usersCurrentPosition }) {
                print("Player \(String(describing: self.playerName ?? "")) took a ladder from \(usersCurrentPosition) : \(String(describing: game.ladders[usersCurrentPosition]))" )
                usersCurrentPosition = game.ladders[usersCurrentPosition] ?? usersCurrentPosition
            } else {
                print("Player \(String(describing: self.playerName ?? "" )) reached at : \(usersCurrentPosition)" )
            }
        }
    }
    
    func rollTheDice() {
        dice = Int.random(in: 1...6)
        usersCurrentPosition += dice
        checkIfUserReachedAnySnakeOrLadder()
    }
    
}

