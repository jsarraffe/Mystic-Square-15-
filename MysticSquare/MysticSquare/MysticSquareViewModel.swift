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
        
        gameModel.isPlaying = false
        gameModel.createGameFor(rows: 4, columns: 4)
        
        
        //        for _ in 0..<10{
        //            gameModel.shuffle()
        //        }
        
    }
    
    func didTapCell(row: Int, column: Int){
        
        
        let tapedShuffle = row == -1 ? true:false
        gameModel.isPlaying = true
        
        if(tapedShuffle) == true {
            
            shuffle(count: Int.random(in: 5..<12))
        }
        //gameBOard[row][column].isExposed = true
        print("ViewMode: tapped cell at \(row), \(column)")
        gameModel.didChooseCell(row: row, column: column)
    }
    
    func shuffle(count: Int){
        if count == 0{
            return
        }
        else {
            gameModel.shuffle()
            DispatchQueue.main.asyncAfter(deadline:.now()+0.1){
                self.shuffle(count: count - 1)
            }
        }
    }
    func reset(){
        gameModel.isPlaying = false
        gameModel.reset()
    }
    func cellAt(row: Int, column: Int) -> BoardCell {
        return gameModel.gameBoard[row][column]
    }
    func gameSize() -> (rows:Int, columns: Int){
        return gameModel.gameSize()
    }
}
