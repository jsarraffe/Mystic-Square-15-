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
        if viewModel.gameModel.didWin(gameboard: viewModel.gameModel.gameBoard){
            dubs()
        }else{
            
            buildGameView(rows: 4, columns: 4)
        }
    }
    func dubs() -> some View{
        Text("Congrats you wasted your time playing this GAME").font(.system(size: 40))
        
    }
    func buildGameView(rows: Int, columns: Int) -> some View {
        

         VStack {
            VStack{
                ForEach(0..<rows){ row in
                    return buildGameRow(row: row, columns: columns)
                }
            }.padding().background(Color.pink).cornerRadius(25)
            
             HStack{
                Text("SHUFAIL")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.title)
                    .onTapGesture {
                        viewModel.didTapCell(row: -1, column: -1)
                    }
            }
         }
    }
    func buildGameRow(row: Int, columns: Int) -> some View {
        return HStack{
            ForEach(0..<columns){ column in
                Button(action: {
                    viewModel.didTapCell(row: row, column: column)
                }){
                    buildCellFor(row: row, column: column)
                }.foregroundColor(.black)
            }
         
        }
        .animation(.easeInOut(duration: 0.4))
    }
//    struct CellView: View{// REPLACE buildCellFOR with CELLVIEW
//        let cell: BoardCell
//        let cornerRadiusForCell: CGFloat
//        let strokeLIneWidth: CGFloat
//
//        var body:   some View{
//            return ZStack {
//                RoundedRectangle(cornerRadius: cornerRadiusForCell).foregroundColor(Color.orange)
//                RoundedRectangle(cornerRadius: cornerRadiusForCell).stroke(lineWidth: strokeLIneWidth)
//
//
//            }
//
//        }
//    }
//
    func buildCellFor(row: Int, column: Int)-> some View {
        return ZStack {
            
            if(viewModel.gameModel.gameBoard[row][column].cellType == .emptyCell){
                Image(systemName: "\(viewModel.gameModel.gameBoard[row][column].cellNum).square.fill").resizable().foregroundColor(.clear).frame(width: 75, height: 75)
                
            }else{
//                RoundedRectangle(cornerRadius: cornerRadiusForCell).foregroundColor(Color.orange)
//                RoundedRectangle(cornerRadius: cornerRadiusForCell).stroke(lineWidth: strokeLIneWidth)
            
                    //Text("\(viewModel.gameModel.gameBoard[row][column].cellNum)")
                Image(systemName: "\(viewModel.gameModel.gameBoard[row][column].cellNum).square.fill").resizable().frame(width: 75, height: 75)
                
                //SF SYMBOLS LIBRARY IS AWSOME
    
            }
        }
    }
    

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
