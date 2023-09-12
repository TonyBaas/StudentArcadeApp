//
//  TicTacToeView.swift
//  studentArcadeApp
//
//  Created by admin on 8/31/23.
//

import SwiftUI

struct TicTacToeView: View {
    @EnvironmentObject var game: GameServices
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentsName = ""
    @FocusState private var focus: Bool
    @State private var gameStart = false
    
    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
                VStack{
                    Text("Tic Tac Toe")
                        .font(.system(size:50))
                        .foregroundColor(.white)
                    Picker("Select Gamemode", selection: $gameType){
                        Text("Select Game Type").tag(GameType.undetermined)
                        Text("Challenge Your Device").tag(GameType.bot)
                        Text("Two Sharing a Device").tag(GameType.single)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                    Text(gameType.description)
                        .padding()
                    VStack(){
                        switch gameType {
                        case .single:
                            VStack{
                                TextField("Your Name", text: $yourName)
                                TextField("Opponent Name", text: $opponentsName)
                            }
                        case .bot:
                            TextField("Your Name", text: $yourName)
                            
                        case .undetermined:
                            EmptyView()
                        }
                    }
                    .padding()
                    .textFieldStyle(.roundedBorder)
                    .focused($focus)
                    .frame(width: 350)
                    if gameType != .undetermined {
                        Button("Start Game") {
                            game.setupGame(gameType: gameType, player1Name: yourName, player2Name: opponentsName)
                            focus = false
                            gameStart.toggle()
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(
                            gameType == .undetermined ||
                            gameType == .bot && yourName.isEmpty ||
                            gameType == .single && (yourName.isEmpty || opponentsName.isEmpty)
                        )
                    }
                    Image("TicTac")
                        .resizable()
                        .frame(width: 250.0, height: 250.0)
                    Spacer()
                }
                .padding()
        )
        .fullScreenCover(isPresented: $gameStart) {
            TicTacToeApp()
        }
        .inNavigationStack()
        
    }
                
}


struct Previews_TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
            .environmentObject(GameServices())
    }
}
