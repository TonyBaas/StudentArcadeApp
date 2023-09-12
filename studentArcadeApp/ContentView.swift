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
            backgroundGradient
                .ignoresSafeArea()
                .overlay(
                    VStack{
                        Image("IMG_0797")
                            .resizable()
                            .frame(width: 250.0, height: 250.0)
                        Text("Select a game to play!")
                            .font(.system(size:35))
                            .padding(.bottom, 10.0)
                            .foregroundColor(.white)
                            
                        // Nav button to Hangman
                        NavigationLink(destination: TicTacToeView()) {
                            Image("TicTac")
                                .resizable()
                                .frame(width: 250.0, height: 250.0)
                        }
                        
                        
                        // Nav button to Hangman
                        NavigationLink(destination: HangmanView()) {
                            Image("Hangman")
                                .resizable()
                                .frame(width: 250.0, height: 250.0)
                        }
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
