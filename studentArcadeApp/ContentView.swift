//
//  ContentView.swift
//  studentArcadeApp
//
//  Created by Tony Baas on 8/29/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Press Me") {
                
            }
            .padding()
            .background(Color(red: 0.2, green: 0, blue: 1))
            .clipShape(Capsule())
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
