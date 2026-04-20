//
//  SetGameApp.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/22/23.
//

import SwiftUI

@main
struct SetGameApp: App {
    var body: some Scene {
        WindowGroup {
            let game = SetGameViewModel()
            SetGameView(game: game)//.background(Color("backgroundColor"))
        }
    }
}
