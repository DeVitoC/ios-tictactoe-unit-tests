//
//  Game.swift
//  TicTacToe
//
//  Created by Lambda_School_Loaner_259 on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
        
    private(set) var board: GameBoard
    
    internal var activePlayer: GameBoard.Mark
    internal var gameIsOver: Bool
    //internal var winningPlayer: GameBoard.Mark
    
    init() {
        gameIsOver = false
        board = GameBoard()
        activePlayer = .x
        
    }
    
    mutating func restart() -> GameBoard {
        board = GameBoard()
        activePlayer = .x
        
        return board
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        
    }
    
}
