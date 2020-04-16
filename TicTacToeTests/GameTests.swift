//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Lambda_School_Loaner_259 on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testRestartGame() {
        var game = Game()
        var board = GameBoard()
        
        // place marks ending with o's turn next
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        
        // attempt to restart game - should be empty board and x's turn
        board = game.restart()
        
        XCTAssertTrue(game.activePlayer == .x)
        XCTAssertNoThrow(try! board.place(mark: .x, on: (0, 0)))
        
    }
    
}
