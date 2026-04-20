//
//  ColoredSetGame.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/22/23.
//

import SwiftUI

class SetGameViewModel: ObservableObject {
    typealias Card = SetGame.Card
    
    @Published private var game: SetGame

    init() {
        game = SetGameViewModel.createSetGame()
    }
    
    var cards: [Card] {
        return game.cards
    }
    
    var faceUpCards: [Card] {
        return game.cards.filter({$0.isInPlay})
    }
    
    var cardsAreLeftInDeck: Bool {
        return game.cards.filter({!$0.isInPlay && $0.isMatched != true}).count != 0
    }
    
    var score: Int {
        return game.score
    }
    
    private static func createSetGame() -> SetGame {
        
        return SetGame()
    }
    
    // MARK: - Intent(s)
    
    func newGame() {
        withAnimation(.easeIn(duration: constants.animationDuration)){
            game = SetGameViewModel.createSetGame()
        }
    }
    
    func drawCard() {
        withAnimation(.easeIn(duration: constants.animationDuration)){
            game.drawCards(numberToDraw: 1)
        }
    }
    
    func select(_ card: Card) {
        game.select(card)
    }
    
    func getColor(card: Card) -> Color {
        switch card.color {
            case .firstColor:
                return Color.green
            case .secondColor:
                return Color.purple
            default:
                return Color.red
        }
    }
    private  struct constants {
        static let animationDuration: Double = 0.5
        
    }
}

