//
//  SymbolView.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/27/23.
//

import SwiftUI

struct SymbolView: View {
    let card: SetGame.Card
    let color: Color
    let size: CGSize
    
    var body: some View {
        VStack {
            Spacer()
            // Display the symbols based on the card number
            switch card.number {
                case .one:
                    symbolToUse()
                case .two:
                    symbolToUse()
                    symbolToUse()
                default:
                    symbolToUse()
                    symbolToUse()
                    symbolToUse()
            }
            Spacer()
        }
    }
    
    // Determines which symbol to display based on the card's symbol type
    @ViewBuilder
    private func symbolToUse() -> some View {
        let width = size.width * SymbolConstants.relativeWidthMultiplier
        let height = size.height * SymbolConstants.relativeHeightMultiplier
        
        ZStack {
            let diamondBorder = Diamond().stroke(color, lineWidth: SymbolConstants.borderWidth)
            let ovalBorder = Capsule().stroke(color, lineWidth: SymbolConstants.borderWidth)
            let squiggleBorder = Squiggle().stroke(color, lineWidth: SymbolConstants.borderWidth)
            
            let diamond = Diamond()
            let oval = Capsule()
            let squiggle = Squiggle()
            
            // Determine symbol type and display corresponding symbol shape.
            switch card.symbol {
                case .diamond:
                    diamondBorder
                    shadingToUse(width: width,height: height).mask(diamond)
                case .oval:
                    ovalBorder
                    shadingToUse(width: width,height: height).mask(oval)
                default:
                    squiggleBorder
                    shadingToUse(width: width,height: height).mask(squiggle)
            }
        }
        .frame(width: width, height: height)
    }
    
    // Determines the shading type and applies shading to the symbol shape.
    @ViewBuilder
    private func shadingToUse(width: CGFloat, height: CGFloat) -> some View {
        switch card.shading {
            case .solid:
                color
            case .striped:
                StripedView(color: color)
            default:
                Color.clear
        }
    }
    
    private struct SymbolConstants {
        static let relativeWidthMultiplier: CGFloat = 0.65
        static let relativeHeightMultiplier: CGFloat = 0.15
        static let borderWidth: CGFloat = 1
    }
}
