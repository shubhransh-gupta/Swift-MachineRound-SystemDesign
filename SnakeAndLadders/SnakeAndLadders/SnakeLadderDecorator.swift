//
//  SnakeLadderDecorator.swift
//  SnakeAndLadders
//
//  Created by Shubhransh Gupta on 05/09/23.
//

import Foundation

class SnakeLadderGame {
    var board = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 10)
    
    var ladders : [Int : Int] = [:]
    
    var snakes : [Int : Int] = [:]
    
    func returnTheBoard() -> [[Int]] {
        return self.board
    }
    
    
    func createABoard() {
        for i in 0..<10 {
            board[0][i] = i
        }
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                board[i][j] = (i) * 10 + (j+1)
            }
        }
    }
    
    
    func createLadders(initial : Int, finalV : Int) -> Bool {
        guard initial < finalV else {
            return false
        }
        ladders[initial] = finalV
        return true
    }
    
    func createSnakes(finalV : Int, initial : Int) -> Bool {
//        ladders[2] = 12
        guard initial < finalV else {
            return false
        }
        snakes[finalV] = initial
        return true
    }
    
}
