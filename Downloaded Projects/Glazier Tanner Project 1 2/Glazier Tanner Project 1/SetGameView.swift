//
//  ColoredSetGameView.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/22/23.
//

import SwiftUI

struct SetGameView: View {
    // MARK: - P
    @StateObject var game: SetGameViewModel
    
    @Namespace private var dealingNamespace
    
    var body: some View {
        VStack {
            topMenu
            gameBody
            HStack {
                Spacer()
                deckBody
            }
            .padding(.horizontal)
        }
    }
    
    @State private var dealt = Set<Int>()
    @State private var discarded = Set<Int>()
    
    // Deal a card and add it to the delt set
    private func deal(_ card: SetGameViewModel.Card) {
        dealt.insert(card.id)
    }
    
    // Discard a card and add it to the discarded set
    private func discard(_ card: SetGameViewModel.Card) {
        discarded.insert(card.id)
    }
    
    // Discard all matched cards
    private func discardCards() {
        for card in game.cards.filter( { $0.isMatched == true && !isDiscarded($0) } ) {
                discard(card)
        }
    }
    
    // Checks if there are matched cards to discard
    private func areCardsToDiscard() -> Bool {
        let count = game.cards.filter( { $0.isMatched == true && !isDiscarded($0) } ).count
        if count == 0 {
            return false
        } else {
            return true
        }
    }
    
    // Checks if a card is delt
    private func isDealt(_ card: SetGameViewModel.Card) -> Bool {
        dealt.contains(card.id)
    }
    
    // Checks if a card is discarded
    private func isDiscarded(_ card: SetGameViewModel.Card) -> Bool {
        discarded.contains(card.id)
    }
    
    // Generates a random off screen location for dealing animation
    private var randomOffScreenLocation: CGSize {
        let radius = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height) * 1.5
        let factor: Double = Int.random(in: 0...1) > 0 ? 1 : -1
        
        return CGSize(width: factor * radius, height: factor * radius)
    }
    
    // Generates animation for dealing cards
    private func dealAnimation(order: Int) -> Animation {
        let delay = Double(order) * CardConstants.delayDuration
        return Animation.easeInOut(duration: CardConstants.dealDuration).delay(delay)
    }
    
    // view for the deck that deals the cards
    var deckBody: some View {
        ZStack {
            ForEach(game.cards.filter({ !isDealt($0) })) { card in
                withAnimation(.easeInOut(duration: CardConstants.dealDuration)) {
                    CardView(card, color: game.getColor(card: card))
                        .transition(AnyTransition.offset(randomOffScreenLocation))
                        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                }
                Text(dealt.isEmpty ? "Deal" : "Deal 3")
            }
        }
        .frame(width: CardConstants.deckWidth, height: CardConstants.deckHeight)
        .onTapGesture {
            if dealt.isEmpty {
                for _ in 0..<12 {
                    game.drawCard()
                }
                var dealOrderIndex = 0
                for card in game.faceUpCards.filter({ !isDealt($0) }) {
                    withAnimation(dealAnimation(order: dealOrderIndex)) {
                        deal(card)
                        dealOrderIndex+=1
                    }
                }
              } else {
                let discarding = areCardsToDiscard()
                discardCards()
                for _ in 0..<3 {
                        game.drawCard()
                }
                var dealOrderIndex = 0
                if discarding == true { dealOrderIndex += 1 }
                for card in game.faceUpCards.filter({ !isDealt($0) }) {
                    withAnimation(dealAnimation(order: 0)) {
                        deal(card)
                        dealOrderIndex += 1
                    }
                }
            }
        }
    }
    
    //View showing the grid of active cards
    var gameBody: some View {
        AspectRatioGrid(items: game.faceUpCards.filter({!isDiscarded($0)}), aspectRatio: CardConstants.aspectRatio) { card in
            if !isDealt(card) {
                Color.clear
            } else {
                withAnimation {
                    CardView(card, color: game.getColor(card: card))
                        .transition(AnyTransition.offset(randomOffScreenLocation))
                        //.opacity(0)
                        .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                        .padding(CardConstants.cardPadding)
                        .onTapGesture {
                            discardCards()
                            withAnimation {
                                game.select(card)
                            }
                        }
                }
            }
        }
    }
    
    // shows the top menu that displays the score and the New Game button
    var topMenu: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
            Button("New Game") {
                withAnimation {
                    dealt = []
                    discarded = []
                    game.newGame()
                }
            }
            Spacer()
            Text("Score: \(game.score)")
        }
    }
        
    private struct CardConstants {
        static let aspectRatio: CGFloat = 2/3
        static let cardPadding: CGFloat = 5
        static let deckWidth: CGFloat = deckHeight * aspectRatio
        static let deckHeight: CGFloat = 90
        static let rotationConstant: Double = 13
        static let rotationDivisor: Double = 3
        static let delayDuration: Double = 0.3
        static let dealDuration: Double = 0.5
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = SetGameViewModel()
        SetGameView(game: game)
    }
}

