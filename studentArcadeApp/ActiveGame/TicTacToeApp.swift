//
//  TicTacToeApp.swift
//  studentArcadeApp
//
//  Created by admin on 9/7/23.
//

import SwiftUI

struct TicTacToeApp: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("EndGame") {
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("Tic Tac Toe")
        .inNavigationStack()
    }
    
    struct TicTacToeApp_Previews: PreviewProvider {
        static var previews: some View {
            TicTacToeApp()
        }
    }
}
