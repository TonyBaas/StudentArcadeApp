//
//  TicTacToeApp.swift
//  studentArcadeApp
//
//  Created by admin on 9/7/23.
//

import SwiftUI

struct TicTacToeApp: View {
    @EnvironmentObject var game: GameServices
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            if[game.player1.isCurrent, game.player2.isCurrent].allSatisfy({ $0 == false}) {
                Text("Select a player to start.")
            }
            HStack {
                Button(game.player1.name) {
                    game.player1.isCurrent = true
                }
                .buttonStyle(PlayerButtonStyle(isCurrent: game.player1.isCurrent))
                Button(game.player2.name) {
                    game.player2.isCurrent = true
                }
                .buttonStyle(PlayerButtonStyle(isCurrent: game.player2.isCurrent))            }
            .disabled(game.gameStarted)
            VStack {
                HStack {
                    ForEach(0...2, id: \.self) { index in SquareView(index: index)
                        
                    }
                }
                HStack {
                    ForEach(3...5, id: \.self) { index in SquareView(index: index)
                        
                    }
                }
                HStack {
                    ForEach(6...8, id: \.self) { index in SquareView(index: index)
                        
                    }
                }
            }
            .disabled(game.boardDissabled)
            VStack{
                if game.gameOver {
                    Text("Game Over!")
                    if game.possibleMoves.isEmpty {
                        Text("Nobody Wins!")
                    }
                    else {
                        Text("\(game.currentPlayer.name) Wins!")
                    }
                    Button ("New Game") {
                        game.reset()
                    }
                    .buttonStyle(.borderedProminent)
                }
                    
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("EndGame") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Tic Tac Toe")
        .onAppear {
            game.reset()
        }
        .inNavigationStack()
    }
    
    struct TicTacToeApp_Previews: PreviewProvider {
        static var previews: some View {
            TicTacToeApp()
                .environmentObject(GameServices())
        }
    }
}

struct PlayerButtonStyle: ButtonStyle {
    let isCurrent: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(isCurrent ? Color.green : Color.gray))
            .foregroundColor(.white)
    }
}
