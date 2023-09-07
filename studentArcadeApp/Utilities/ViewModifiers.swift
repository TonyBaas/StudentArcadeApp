//
//  ViewModifiers.swift
//  studentArcadeApp
//
//  Created by admin on 9/5/23.
//

import Foundation
import SwiftUI

struct NavStackContainer: ViewModifier{
    func body(content: Content) -> some View {
        if #available(iOS 16, *) {
            NavigationStack {
                content
            }
        }
        else {
            NavigationView {
                content
            }
            .navigationViewStyle(.stack)
        }
    }
}

extension View {
    public func inNavigationStack() -> some View {
        return self.modifier(NavStackContainer())
    }
}
