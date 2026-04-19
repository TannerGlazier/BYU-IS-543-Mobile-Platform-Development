//
//  Concentration_GameApp.swift
//  Concentration Game
//
//  Created by Tanner Glazier on 10/10/23.
//

import SwiftUI

@main
struct Concentration_GameApp: App {
    var body: some Scene {
        WindowGroup {
            ConcentrationGameView(emojiGame: EmojiConcentrationGame())
        }
    }
}
