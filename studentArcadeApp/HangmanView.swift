//
//  HangmanView.swift
//  studentArcadeApp
//
//  Created by Nicholas Woerner on 8/31/23.
//

import SwiftUI

struct HangmanView: View {
    @State private var chosenWord = ""
    @State private var displayWord = ""
    @State private var guess = ""
    @State private var incorrectLetterArray = [Character]()
    @State private var usedLetter = [Character]()
    
    
    
    var body: some View {
        VStack{
            //Text heading and style for the game
            Text("Hangman")
                .font(.largeTitle)
            Spacer()
            
            // Game Content below
            Text("Guess a letter!")
            Spacer()
            Spacer()
            
            HStack {
                Button(action: {
                    //Guess button tap
                    makeGuess()
                }) {
                    Text("Guess")
                        .padding(13)
                        .background(Color.black)
                        .foregroundColor(Color.purple)
                        .cornerRadius(10)
                }
                Button(action: {
                    //Reset button tap
                    resetGame()
                }) {
                    Text("Reset")
                        .padding(13)
                        .background(Color.black)
                        .foregroundColor(Color.purple)
                        .cornerRadius(10)
                }
                
            }
        }
  
    }
    
    func makeGuess() {
        //Guess logic
    }
    
    func resetGame() {
        //Reset Logic
    }
}

struct HangmanView_Previews: PreviewProvider {
    static var previews: some View {
        HangmanView()
    }
}


    var wordArray = ["WATER", "SENTENCE", "APARTMENT", "BLANKET", "SWIFT", "PROGRAMMING", "BUTLER", "HIGHWAY", "AIRPORT", "MOUNTAIN", "NATURE", "FRIEND", "PROFESSOR", "SOUTHEAST", "COLLEGE", "DECEMBER"]
    var chosenWord = ""
    var displayArray = [Character]()
    var displayWord = ""
    var guess: Character!
