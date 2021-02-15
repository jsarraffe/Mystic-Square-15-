//
//  MysticSquareViewModel.swift
//  MysticSquare
//
//  Created by Jacques Sarraffe on 2/8/21.
//

import Foundation

class MSViewModel: ObservableObject {
    //Object in this class that needs to observe changes, and gameModel is that object
    
    
    // bridges between the model and the view
    
    // to interpret the model for the view
    // to communicate the user intent to the model
    @Published var gameModel = MSModel()
    //publish to those who have subscribed to get notified about changes
    init () {
        
        gameModel.createGameFor(rows: 4, columns: 4)
        gameModel.shuffle(counter: Int.random(in: 0...5))
    }
    func didTapCell(row: Int, column: Int){
        
        
        let shuffle = row == -1 ? true:false
        
        if(shuffle) == true {
            gameModel.shuffle(counter: Int.random(in: 20...40))
           
        }
        
        //gameBOard[row][column].isExposed = true
        print("ViewMode: tapped cell at \(row), \(column)")
        gameModel.didChooseCell(row: row, column: column)
    }
    
    func cellAt(row: Int, column: Int) -> BoardCell {
        return gameModel.gameBoard[row][column]
    }
    func gameSize() -> (rows:Int, columns: Int){
        return gameModel.gameSize()
    }
}
