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
    
    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    private(set) var gameState: GameState
    
    init() {
        gameIsOver = false
        board = GameBoard()
        activePlayer = .x
        gameState = .active(activePlayer ?? .x)
        winningPlayer = nil
    }
    
    mutating func restart() -> GameBoard {
        board = GameBoard()
        activePlayer = .x
        
        return board
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else { return }
        do {
            try board.place(mark: activePlayer, on: coordinate)
            if game(board: board, isWonBy: activePlayer) {
                winningPlayer = activePlayer
                self.activePlayer = nil
                if let winningPlayer = winningPlayer {
                    gameState = .won(winningPlayer)
                }
            } else if board.isFull {
                gameState = .cat
            } else {
                let newPlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
                gameState = .active(newPlayer)
            }
        } catch {
            NSLog("Illegal move in Game.swift")
        }
    }
    
//    func getGameState() -> GameState {
//        return gameState
//    }
    
}
