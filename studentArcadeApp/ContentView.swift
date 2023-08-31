//
//  ContentView.swift
//  studentArcadeApp
//
//  Created by Tony Baas on 8/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: TicTacToeView()) {
                    Text("Tic-Tac-Toe")
                }
                .padding()
                .background(Color(red: 0.2, green: 0, blue: 1))
                .clipShape(Capsule())
                .foregroundColor(.white)
                NavigationLink(destination: HangmanView()) {
                    Text("Hangman")
                }
                .padding()
                .background(Color(red: 0.2, green: 0, blue: 1))
                .clipShape(Capsule())
                .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
