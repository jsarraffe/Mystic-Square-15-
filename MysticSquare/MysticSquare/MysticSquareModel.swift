//
//  MysticSquareModel.swift
//  MysticSquare
//
//  Created by Jacques Sarraffe on 2/8/21.
//

import Foundation

struct MSModel{
    // the internal representation of the game will be stored in this file
    // include the logic for playing the game
    
    var gameBoard: [[BoardCell]] = []
    var numberOfRows = 0
    var numberOfColumns = 0
    
    
    mutating func createGameFor(rows: Int, columns: Int){
        
        numberOfRows = rows
        numberOfColumns = columns
        var count = 1
        for rowIdx in 0..<rows{
            gameBoard.append([BoardCell]() )
            for _ in 0..<columns {
                gameBoard[rowIdx].append(BoardCell(cellNum: count))
                count += 1
            }
        }
    }
    func gameSize() -> (rows: Int, columns: Int){
        return (numberOfRows, numberOfColumns)
}
    func didChooseCell(row: Int, column: Int){
        
        //gameBoard[row][column].isExposed = true
        print("ViewMode: tapped cell at \(row), \(column)")
        //print(gameBoard[row][column]
    }
}

/*
        canSwitchNumbers
 
        Two for loops                    x
        Check if in matrix              x1x
                                         x
            Check for X
 */


/*
 enum CellType: Comparable{
    case openCell
    case MineCell
 
 }
 
x
 }
 
 
 }
 
 
 */


struct BoardCell {
    var cellNum: Int 
}
