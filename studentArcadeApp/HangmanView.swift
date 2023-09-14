//
//  HangmanView.swift
//  studentArcadeApp
//
//  Created by Nicholas Woerner on 8/31/23.
//

import SwiftUI

struct HangmanView: View {
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var newGameAlert = false
    @State private var chosenWord = ""
    @State private var displayWord = ""
    @State private var guess = ""
    @State private var incorrectLetterArray = [Character]()
    @State private var usedLetter = [Character]()
    @State private var hangmanState = 0 //hangman's initial state
    @State private var incorrectGuesses = ""
    @State private var gameWon = false
    
    
    
    //maximum incorrect guesses
    var MaxIncorrectGueses = 6
    
    //Array for the words
    var wordArray = ["CAT", "RAT", "TAP", "SON", "RUN", "JOG", "FOX", "DOG", "FRY", "TIE"]

    var body: some View {
        backgroundGradient
            .ignoresSafeArea()
            .overlay(
            VStack {
                Text("Hangman")//Title of game
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                // Display the incorrect guesses with commas
                Text("Guessed Letters: \(incorrectGuesses)")
                                .foregroundColor(.white)
                                .padding(.bottom, 100)
                
                Spacer()
                
                
                
                Text("Guess a letter!")//Directions
                    .foregroundColor(.white)
                
                //Image that displays the initial stand and rope
                //Also updates to show the new one as incorrect guesses increase from 0
                Image("hangMan\(hangmanState)")
                    .resizable()
                    .frame(width: 275, height: 275)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(.bottom, 75)
                
                Text(displayWord)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                //Text box for user input
                TextField("Enter a letter", text: $guess)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.allCharacters)
                    .frame(width: 175)
                
                Spacer()
                Spacer()
                
                HStack {
                    //guess button and text/styles for it
                    Button(action: {
                        print("Guess button tapped")
                        makeGuess()
                    }) {
                        Text("Guess")
                            .padding(25)
                            .background(Color(red: 0.2,green: 0, blue: 1))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    
                    //reset button and text/styles for it
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
                    .padding(60)
        )
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text(alertMessage),
                            primaryButton: .default(Text("New Game")) {
                                resetGame()
                            },
                            secondaryButton: .cancel()
                        )
                    }
            .onAppear {
                startNewGame()
            }
        
    }
    
    //Function that starts a new game
    func startNewGame() {
        // Chooses a random word from wordArray
                chosenWord = wordArray.randomElement() ?? "CAT" // Default to "CAT" if array is empty
                hangmanState = 0 // Resets hangman state
                displayWord = String(repeating: "_", count: chosenWord.count)
                incorrectGuesses = ""
                usedLetter.removeAll()
                alertMessage = "Guess a letter" // Alert message
    }
    
    
    //function for when guess button is tapped
    func makeGuess() {
        print("makeguess function started")//debug
        // Check if the game has already been won or lost
           guard !alertMessage.isEmpty else {
               print("Alert message is empty")//debug
               return
           }
        
        // Check if the guess is a single character
        print("Guessed letter: \(guess)")//debug
        guard guess.count == 1 else {
            print("Guess is not a single character")//debug
            alertMessage = "Must be a one letter guess"
            showAlert = true
            return
        }
        
        // Check if the guessed character has already been used
        guard !usedLetter.contains(guess.first!) else {
            print("Guessed letter has already been used")//debug
            alertMessage = "You already guessed that letter"
            showAlert = true
            return
        }
        
        // Convert the guess to a character
        if let guessedChar = guess.uppercased().first {
            print("Guesed character: \(guessedChar)")
            usedLetter.append(guessedChar) //Adds the guessed letter to usedLetter
            
            //hangman/letter updater for wrong guess
            if !chosenWord.contains(guessedChar) {
                print("Incorrect guess: \(guessedChar)")//debug
            hangmanState += 1 // updates hangman image if guess wrong
            incorrectGuesses.append(guessedChar) //updates guessed letter box
            }
            
            var newDisplayWord = ""
            
            //updater for right guess
            for (index, char) in chosenWord.enumerated() {
                        if char == guessedChar {
                        // This replaces the corresponding underscore with the guessed letter
                            newDisplayWord += String(guessedChar)
                        } else {
                        newDisplayWord += String(displayWord[displayWord.index(displayWord.startIndex, offsetBy: index)])
                    }
                }
            displayWord = newDisplayWord
            
            print("Display Word: \(displayWord)")
            print("Chosen Word: \(chosenWord)")
            
            //Checks for the win and displays message
            if displayWord == chosenWord {
                alertMessage = "You have won! You are amazing at guessing 3 letter words! The word was \(chosenWord)."
                showAlert = true
                print("Game won!") // Debug
                            return
                            }
            print("DEBUG: displayWord: \(displayWord)") //debug
            print("DEBUG: chosenWord: \(chosenWord)")
            
            //Checks for the loss and displays message
            if hangmanState == MaxIncorrectGueses {
                alertMessage = "You have lost! You are horrible at guessing 3 letter words! The word was \(chosenWord)."
                showAlert = true
                print("Game lost!") // Debug
                return
            }
        }
        
        // Clear the guess
        guess = ""
    }
    
    // resets everything
    func resetGame() {
        chosenWord = ""
        displayWord = ""
        guess = ""
        incorrectLetterArray.removeAll()
        usedLetter.removeAll()
        hangmanState = 0
        incorrectGuesses = ""
        gameWon = false
        startNewGame()
        alertMessage = ""
    }
}
    
    struct HangmanView_Previews: PreviewProvider {
        static var previews: some View {
            HangmanView()
        }
    }
