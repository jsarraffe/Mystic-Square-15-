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
                if count != 16{
                    gameBoard[rowIdx].append(BoardCell(cellType: .gameObject, cellNum: count))
                } else{
                    gameBoard[rowIdx].append(BoardCell(cellType: .emptyCell, cellNum: 16))
                }
                
                count += 1
            }
        }
    }
    
    mutating func shuffle(square :[[BoardCell]]){
        
        
        
    }
    
    func get grandom
    
    
    func gameSize() -> (rows: Int, columns: Int){
        return (numberOfRows, numberOfColumns)
    }
    func adjacent(rows: Int, columns: Int, freeRow: Int, freeColumn: Int) -> Bool {
        
        if(freeRow + 1 == rows && columns == freeColumn){
            return true
        }
        if(freeRow - 1 == rows && columns == freeColumn){
            return true
        }
        if(freeColumn + 1 == columns && rows == freeRow){
            return true
        }
        if(freeColumn - 1 == columns && rows == freeRow){
            return true
        }
        return false
        
        
    }
    mutating func didChooseCell(row: Int, column: Int){
        
        //gameBoard[row][column].isExposed = true
        print("ViewMode: tapped cell at \(row), \(column)")
        //print(gameBoard[row][column]
        var x: Int = 0
        var y: Int = 0
        for i in 0..<gameBoard.count{
            for j  in 0..<gameBoard[i].count{
                if gameBoard[i][j].cellType == .emptyCell{
                    x = i; y=j
                }
            }
        }
        if(adjacent(rows: row, columns: column, freeRow: x, freeColumn: y)){
            gameBoard[x][y].cellType = .gameObject
            gameBoard[x][y].cellNum = gameBoard[row][column].cellNum
            gameBoard[row][column].cellNum = 16
            gameBoard[row][column].cellType = .emptyCell
            
        }
    }
}
enum CellType {
    case gameObject
    case emptyCell
}

struct BoardCell {
    var cellType: CellType
    var cellNum: Int
    
}
