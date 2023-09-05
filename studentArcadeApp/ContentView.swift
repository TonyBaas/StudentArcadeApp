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
            VStack{
                Text("Select a game to play!")
                    .font(.system(size:40))
                    .padding(.bottom, 100.0)
                    
                NavigationLink(destination: TicTacToeView()) {
                    Text("TicTacToe")
                        .navigationBarTitle(Text("Menu"))
                        .padding(50)
                        .background(Color(red: 0.2, green: 0, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .foregroundColor(.white)
                }
                
                
                NavigationLink(destination: HangmanView()) {
                    Text("Hangman")
                    //Image(systemName: "swift")
                        .padding(50)
                        .background(Color(red: 0.2, green: 0, blue: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .foregroundColor(.white)
                }
                
            }
            .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
