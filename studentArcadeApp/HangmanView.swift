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
    @State private var hangmanState = 0 //hangman's initial state
    
    
    
    //maximum incorrect guesses
    var MaxIncorrectGueses = 7
    
    //Array for the words
    var wordArray = ["CAT", "RAT", "TAP", "SON", "RUN", "JOG", "FOX", "DOG", "FRY", "TIE"]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Hangman")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Guess a letter!")
                    .foregroundColor(.white)
                
                Image("hangMan0\(hangmanState)")
                    .resizable()
                    .frame(width: 275, height: 275)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                
                Text(displayWord)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                TextField("Enter a letter", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.allCharacters)
                    .frame(width: 175)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        makeGuess()
                    }) {
                        Text("Guess")
                            .padding(25)
                            .background(Color(red: 0.2,green: 0, blue: 1))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        resetGame()
                    }) {
                        Text("Reset")
                            .padding(25)
                            .background(Color(red: 0.2,green: 0, blue: 1))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .onAppear {
            startNewGame()
        }
    }
    
    //Function that starts a new game
    func startNewGame() {
        // Chooses a random word from wordArray
        guard let randomWord = wordArray.randomElement()?.uppercased()
        else{
            chosenWord = "CAT"
            return
        }
        chosenWord = randomWord
        hangmanState = 0 //Resets hangman state
        displayWord = String(repeating: "_", count: chosenWord.count)
    }
    
    
    func makeGuess() {
        // Check if the guess is a single character
        guard guess.count == 1 else {
            // Handle invalid guess (more than one character)
            return
        }
        
        // Convert the guess to a character
        if let guessedChar = guess.uppercased().first {
            var newDisplayWord = ""
            
            if !chosenWord.contains(guessedChar) {
                hangmanState != 1 // updates hangman image
            }
            
            for (index, char) in chosenWord.enumerated() {
                if char == guessedChar {
                    //This replaces the corresponding underscore with the guessed letter
                    newDisplayWord += String(guessedChar)
                } else {
                    //keeps underscore or already guessed letters
                    newDisplayWord += String(displayWord[displayWord.index(displayWord.startIndex, offsetBy: index)])
                }
            }
            // Process the guess with the character (guessedChar)
            // You can update your game logic here
        }
        
        // Clear the guess
        guess = ""
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
