//
//  SetGame.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/22/23.
//

import SwiftUI

struct SetGame {
    
    // Define possible card attributes
    enum CardColor: CaseIterable {
        case firstColor, secondColor, thirdColor
    }
    
    enum Symbol: CaseIterable {
        case diamond, squiggle, oval
    }
    
    enum SymbolShading: CaseIterable {
        case solid, striped, open
    }
    
    enum NumberOfSymbols: Int, CaseIterable {
        case one = 1, two = 2, three = 3
    }
    
    var cards: [Card]
    var score = 0
    
    private var selectedCardsIndices: [Int] {
        get { cards.indices.filter({cards[$0].isSelected}) }
    }
    
    mutating func drawCards(numberToDraw: Int) {
        if numberToDraw > cards.filter({!$0.isInPlay && $0.isMatched != true}).count {
            return
        }
        
        if selectedCardsIndices.count > 0 {
            if cards[selectedCardsIndices[0]].isMatched == true {
                swapMatchedWithNewCard(selectedCardsIndices[0])
                return
            }
            
            if cards[selectedCardsIndices[1]].isMatched == true {
                swapMatchedWithNewCard(selectedCardsIndices[1])
                return
            }
            
            if cards[selectedCardsIndices[2]].isMatched == true {
                swapMatchedWithNewCard(selectedCardsIndices[2])
                return
            }
        }
        
        for _ in 0..<numberToDraw {
            guard let index = cards.firstIndex(where: {!$0.isInPlay && $0.isMatched != true}) else { return }
            cards[index].isInPlay = true
            cards[index].isDealing = true
        }
    }
    
    mutating func drawThreeCards() {
//        if let _ = firstPossibleMatch() {
            if selectedCardsIndices.count == 3 && cards[selectedCardsIndices[0]].isMatched == true {
                score -= 3
            }
//        }
        resetHighlight()
        drawCards(numberToDraw: 3)
    }
    // Select a card
    mutating func select(_ card: Card) {
        if let selectedIndex = cards.firstIndex(where: {$0.id == card.id}) {
            resetHighlight()
            
            if !cards[selectedIndex].isSelected {
                switch selectedCardsIndices.count {
                    case let x where x < 2:
                        cards[selectedIndex].isSelected = true
                    // If 2 cards are selected, check for a match and update the score accordingly.
                    case 2:
                        if(isSelectedSetMatch(index: selectedIndex)) {
                            cards[selectedCardsIndices[0]].isMatched = true
                            cards[selectedCardsIndices[1]].isMatched = true
                            cards[selectedIndex].isSelected = true
                            cards[selectedIndex].isMatched = true
                            score += getScore(cards: [cards[selectedCardsIndices[0]], cards[selectedCardsIndices[1]], cards[selectedIndex]])
                        } else {
                            cards[selectedCardsIndices[0]].isMatched = false
                            cards[selectedCardsIndices[1]].isMatched = false
                            cards[selectedIndex].isSelected = true
                            cards[selectedIndex].isMatched = false
                        }
                    // If 3 cards are selected, reset the selection and select the current card.
                    case 3:
                        resetSelection()
                        cards[selectedIndex].isSelected = true
                    default:
                        return
                }
            // If the selected card is already selected, handle deselection logic.
            } else if cards[selectedIndex].isMatched == false {
                resetSelection()
                cards[selectedIndex].isSelected = true
            } else {
                switch selectedCardsIndices.count {
                    case 1,2:
                        cards[selectedIndex].isSelected = false
                    default:
                        return
                }
            }
        } else {
            return
        }
    }
    
    private mutating func resetHighlight() {
        cards.indices.filter({cards[$0].isInPlay}).forEach() { index in
            if cards[index].highlighted == true { cards[index].highlighted = false }
        }
    }
    
    private mutating func resetSelection() {
        cards.indices.filter({cards[$0].isInPlay}).forEach() { index in
            if let matched = cards[index].isMatched {
                if matched == true {
                    cards[index].isSelected = false
                } else {
                    cards[index].isMatched = nil
                    cards[index].isSelected = false
                }
            } else {
                cards[index].isSelected = false
            }
        }
    }
    
    // Swap a matched card with a new one
    private mutating func swapMatchedWithNewCard(_ matchedCardIndex: Int) {
        cards[matchedCardIndex].isSelected = false
        if let index = cards.firstIndex(where: {!$0.isInPlay && $0.isMatched != true}) {
            cards[index].isInPlay = true
            cards.swapAt(index, matchedCardIndex)
        } else {
            return
        }
    }
    
    // Checks if the selected cards are a match
    private func isSelectedSetMatch(index: Int) -> Bool {
        let card1 = cards[index]
        let card2 = cards[selectedCardsIndices[0]]
        let card3 = cards[selectedCardsIndices[1]]

        return isSetMatch(cards: [card1, card2, card3])
    }
    
    private func isSetMatch(cards: [Card]) -> Bool {
        if ((cards[0].color == cards[1].color && cards[1].color == cards[2].color)
            || (cards[0].color != cards[1].color && cards[1].color != cards[2].color && cards[0].color != cards[2].color)
        ) {
            if ((cards[0].symbol == cards[1].symbol && cards[1].symbol == cards[2].symbol)
                || (cards[0].symbol != cards[1].symbol && cards[1].symbol != cards[2].symbol && cards[0].symbol != cards[2].symbol)
            ) {
                if ((cards[0].shading == cards[1].shading && cards[1].shading == cards[2].shading)
                    || (cards[0].shading != cards[1].shading && cards[1].shading != cards[2].shading && cards[0].shading != cards[2].shading)
                ) {
                    if ((cards[0].number == cards[1].number && cards[1].number == cards[2].number)
                        || (cards[0].number != cards[1].number && cards[1].number != cards[2].number && cards[0].number != cards[2].number)
                    ) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    // Calculate the score
    private func getScore(cards: [Card]) -> Int {
        var score = 0
        for card in cards {
            if let time = card.timeSinceFaceUp {
                score += max(2, 25 + Int(time.timeIntervalSinceNow))
            }
        }
        return score
    }
    
    init() {
        var cards = [Card]()
        var count = 0
        
        for color in CardColor.allCases {
            for symbol in Symbol.allCases {
                for shading in SymbolShading.allCases {
                    for number in NumberOfSymbols.allCases {
                        cards.append(
                            Card(
                                id: count,
                                color: color,
                                symbol: symbol,
                                shading: shading,
                                number: number
                            ))
                        count += 1
                    }
                }
            }
        }
        
        self.cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        let id: Int
        let color: CardColor
        let symbol: Symbol
        let shading: SymbolShading
        let number: NumberOfSymbols
        
        var isInPlay = false {
            willSet {
                timeSinceFaceUp = Date()
            }
        }
        var isSelected = false
        var isMatched: Bool?
        var isDealing = false
        var timeSinceFaceUp: Date?
        var highlighted: Bool = false
    }
}

