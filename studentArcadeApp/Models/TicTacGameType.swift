//
//  TicTacGameType.swift
//  studentArcadeApp
//
//  Created by admin on 9/5/23.
//

import Foundation

enum GameType{
    case single, bot, undetermined
    
    var description: String{
        switch self {
        case .single:
            return "Share your IPhone and play with a friend."
        case .bot:
            return "Play against this IPhone."
        case .undetermined:
            return ""
        }
    }
}
