//
//  ContentView.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/22/23.
//

import SwiftUI

struct SetGameView: View {
    @StateObject var game: ShapeSetGame
    
    @Namespace private var dealingNamespace

    let shapeGame: ShapeSetGame
    

    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(columns: columns(for: geometry.size)) {
                ForEach (shapeGame.cards) { card in
                    // You'll need to change the Font parameter here
                    CardView(card: card)
                        .onTapGesture {
                            shapeGame.select(card)
                        }
                }
            }
            .padding()
        }
    }
    private func columns(for size:CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()), count: Int(size.width / 125))
    }
}

struct CardView: View {
    // if you need to modify the appearance of the card, use this isTapped variable and the accompanying if statment
    // Change <String>
    let card: SetGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                if card.isTapped {
                    RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.white)
                    RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
                    Text(card.content)
                        .font(systemFont(for: geometry.size))
                } else {
                    RoundedRectangle(cornerRadius: Card.cornerRadius).fill(.green.opacity(Card.opacity))
                    RoundedRectangle(cornerRadius: Card.cornerRadius).stroke()
                    Text(card.content)
                }
            }
            .foregroundStyle(.blue)
        }
        .aspectRatio(Card.aspectRatio,  contentMode:.fit)
    }
    
    // MARK: - Constants
    
    private struct Card {
        static let aspectRatio = 3.0/2.0
        static let cornerRadius = 10.0
        static let opacity = 0.25
        // This font will need to change
        static let fontScaleFactor = 0.75
    }
    
    private func systemFont(for size: CGSize) -> Font {
        .system(size: min(size.width, size.height) * Card.fontScaleFactor)
    }
}

#Preview {
    SetGameView(shapeGame: ShapeSetGame())
}
