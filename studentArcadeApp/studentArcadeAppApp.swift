//
//  studentArcadeAppApp.swift
//  studentArcadeApp
//
//  Created by Tony Baas on 8/29/23.
//

import SwiftUI

@main
struct studentArcadeAppApp: App {
    @StateObject var game = GameServices()
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(game)

        }
    }
}
