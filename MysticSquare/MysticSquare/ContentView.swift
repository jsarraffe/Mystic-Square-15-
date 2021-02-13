//
//  ContentView.swift
//  MysticSquare
//
//  Created by Jacques Sarraffe on 2/8/21.
//

import SwiftUI

struct ContentView: View {
    
    let cornerRadiusForCell: CGFloat = 10.0
    let strokeLIneWidth: CGFloat = 2.0
    
    @ObservedObject var viewModel = MSViewModel()
    //it's intrested in recieving changes
    
    var body: some View {
        buildGameView(rows: 4, columns: 4)
    }
    func buildGameView(rows: Int, columns: Int) -> some View {
        return VStack {
            ForEach(0..<rows){ row in
                return buildGameRow(row: row, columns: columns)
            }
            
            
        }
    }
    func buildGameRow(row: Int, columns: Int) -> some View {
        return HStack{
            ForEach(0..<columns){ column in
                buildCellFor(row: row, column: column)
                    .onTapGesture {
                        viewModel.didTapCell(row: row, column: column)
                    }
            }
         
        }
    }
    struct CellView: View{// REPLACE buildCellFOR with CELLVIEW
        let cell: BoardCell
        let cornerRadiusForCell: CGFloat
        let strokeLIneWidth: CGFloat
        
        var body:   some View{
            return ZStack {
                RoundedRectangle(cornerRadius: cornerRadiusForCell).foregroundColor(Color.orange)
                RoundedRectangle(cornerRadius: cornerRadiusForCell).stroke(lineWidth: strokeLIneWidth)
                
            }
            
        }
    }
    
    func buildCellFor(row: Int, column: Int)-> some View {
        return ZStack {
            RoundedRectangle(cornerRadius: cornerRadiusForCell).foregroundColor(Color.orange)
            RoundedRectangle(cornerRadius: cornerRadiusForCell).stroke(lineWidth: strokeLIneWidth)
            if(viewModel.gameModel.gameBoard[row][column].cellType) == .gameObject{
                Text("\(viewModel.gameModel.gameBoard[row][column].cellNum)")
            }
        }
    }
    

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
