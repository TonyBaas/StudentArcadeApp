//
//  ContentView.swift
//  studentArcadeApp
//
//  Created by Tony Baas on 8/29/23.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color(red: 0.1, green: 0, blue: 1), Color(red: 1, green: 0, blue: 0.5)],
    startPoint: .topTrailing, endPoint: .bottomLeading)

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
                            Text("TicTacToe")
                                
                                .padding(50)
                                .background(Color(red: 0.2, green: 0, blue: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .foregroundColor(.white)
                        }
                        
                        // Nav button to Hangman
                        NavigationLink(destination: HangmanView()) {
                            Text("Hangman")
                                .padding(50)
                                .background(Color(red: 0.2, green: 0, blue: 1))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .foregroundColor(.white)
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
