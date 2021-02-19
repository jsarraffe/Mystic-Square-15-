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
        if viewModel.gameModel.didWin(gameboard: viewModel.gameModel.gameBoard) && viewModel.gameModel.isPlaying == true{
            dubs()
        }else{
            buildGameView(rows: 4, columns: 4)
        }
        
    }
    
    // dubs is the W, or win view
    func dubs() -> some View{
        return VStack{
            Button(action: {
                viewModel.reset()
            }){
                Text("Reset")
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .onTapGesture {
                        
                        viewModel.reset()
                        
                    }
                
            }.transition(.slide)
            Text("Congrats you HAVE WON!!!!!!").foregroundColor(Color.white).font(.system(size: 25)).transition(.move(edge: .bottom))
        }
        
    }
    func buildGameView(rows: Int, columns: Int) -> some View {
        
        VStack {
            VStack{
                ForEach(0..<rows){ row in
                    return buildGameRow(row: row, columns: columns)
                }
            }.padding().background(Color.pink).cornerRadius(25)
            
            
            HStack{
                Button(action: {
                    
                    viewModel.shuffle(count: Int.random(in: 15...30))
                }){
                    
                    Text("Shuffle")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .padding(12)
                        .border(Color.black, width: 8)
                    
                    
                }
                Button(action: {
                    
                    viewModel.reset()
                }){
                    
                    Text("  Reset ")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .padding(12)
                        .border(Color.black, width: 8)
                        
                        .onTapGesture {
                            
                            viewModel.reset()
                            
                        }.foregroundColor(.black)
                    
                    
                }.padding(12).transition(.identity).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                
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
        .animation(.interactiveSpring())
    }
    
    func buildCellFor(row: Int, column: Int)-> some View {
        return ZStack {
            //used SFsymbols to simplify   example 43.square.fill
            if(viewModel.gameModel.gameBoard[row][column].cellType == .emptyCell){
                Image(systemName: "\(viewModel.gameModel.gameBoard[row][column].cellNum).square.fill").resizable().foregroundColor(.clear).frame(width: 75, height: 75)
                
            }else{
                Image(systemName: "\(viewModel.gameModel.gameBoard[row][column].cellNum).square.fill").resizable().frame(width: 75, height: 75)
                
                
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
