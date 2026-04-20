//
//  CardView.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/24/23.
//

import SwiftUI

struct CardView: View {
    let card: SetGame.Card
    let color : Color
    
    init(_ card: SetGame.Card, color: Color) {
        self.card = card
        self.color = color
    }
    
    var body: some View {
        GeometryReader { geometry in
            SymbolView(card: card, color: color, size: geometry.size)
                .cardify(
                    isFaceUp: card.isInPlay,
                    isSelected: card.isSelected,
                    isMatched: card.isMatched,
                    highlighted: card.highlighted,
                    color: color
                )
        }
    }
}


