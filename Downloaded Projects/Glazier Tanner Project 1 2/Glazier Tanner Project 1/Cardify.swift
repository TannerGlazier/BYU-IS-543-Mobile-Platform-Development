//
//  Cardify.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/24/23.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isSelected: Bool
    let isMatched: Bool?
    let highlighted: Bool
    let color: Color
    
    // Initializes the Cardify modifier with specified parameters.
    init(isFaceUp: Bool, isSelected: Bool, isMatched: Bool?, highlighted: Bool, color: Color) {
        self.isSelected = isSelected
        self.isMatched = isMatched
        self.highlighted = highlighted
        self.color = color
        
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double
    
    // Applies styling and animations to the card content.
    func body(content: Content) -> some View {
        ZStack {
            if rotation < 90 {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.strokeBorder(.black, lineWidth: 1)
                content
                shape.strokeBorder(.yellow.opacity(highlighted ? 0.3: 0), lineWidth: DrawingConstants.lineWidth)
                shape.fill(.green).opacity(isMatched == true && isSelected ? 0.3 : 0)
                shape.fill(.red).opacity(isMatched == false && isSelected ? 0.3 : 0)
                shape.fill(.blue).opacity(isMatched == nil && isSelected ? 0.3 : 0)
                
            } else {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                shape.strokeBorder(.black, lineWidth: 1)
            }
        }
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 5
    }
}

extension View {
    func cardify(isFaceUp: Bool, isSelected: Bool, isMatched: Bool?, highlighted: Bool, color: Color) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, isSelected: isSelected, isMatched: isMatched, highlighted: highlighted, color: color))
    }
}
