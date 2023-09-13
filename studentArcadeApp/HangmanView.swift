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
    
    var wordArray = ["CAT", "RAT", "TAP", "SON", "RUN", "JOG", "FOX", "DOG", "FRY", "TIE"]


    var body: some View {
        

                VStack{
                    //Text heading and style for the game
                    Text("Hangman")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                    // Game Content below
                    Text("Guess a letter!")
                        .foregroundColor(.white)
                    
                    // Display the "hangman" image asset
                    Image("hangMan0")
                            .resizable()
                            .frame(width: 275, height: 275)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                    
                    Text(displayWord)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    // TextField for entering a letter guess
                    TextField("Enter a letter", text: $guess)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.allCharacters)
                        .frame(width: 150)

                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                HStack {

                    Button(action: {
                        //Guess button tap
                        makeGuess()
                    }) {
                        Text("Guess")
                            .padding(25)
                            .background(Color(red: 0.2,green: 0, blue: 1))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        //Reset button tap
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
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
        
            .onAppear {
                startNewGame()
            }
    }
    
            //Function that starts a new game
            func startNewGame() {
            // Chooses a random word from wordArray
            guard let randomWord = wordArray.randomElement()?.uppercased() else {#imageLiteral(resourceName: "simulator_screenshot_750A92AE-9659-464A-8168-C43FC2C2555E.png")
                return
            }
            chosenWord = randomWord
            // Shows the amount of dashes regarding the amount of letters per word
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
