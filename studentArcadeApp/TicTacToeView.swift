//
//  TicTacToeView.swift
//  studentArcadeApp
//
//  Created by admin on 8/31/23.
//

import SwiftUI

struct TicTacToeView: View {
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentsName = ""
    @FocusState private var focus: Bool
    var body: some View {
        VStack{
            Picker("Select Gamemode", selection: $gameType){
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Challenge Your Device").tag(GameType.bot)
                Text("Two Sharing a Device").tag(GameType.single)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
            .accentColor(.primary)
            Text(gameType.description)
                .padding()
            VStack{
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
                    focus = false
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undetermined ||
                    gameType == .bot && yourName.isEmpty ||
                    gameType == .single && (yourName.isEmpty || opponentsName.isEmpty)
                )
            }
            Image("LaunchScreen")
            Spacer()
        }
        
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
