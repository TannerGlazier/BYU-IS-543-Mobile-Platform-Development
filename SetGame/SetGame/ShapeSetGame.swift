//
//  ShapeSetGame.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/22/23.
//

import SwiftUI

//struct Diamond: Shape{
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        
//        return path
//    }
//}

//struct Arc: Shape {
//    let startAngle: Angle
//    let endAngle: Angle
//    let Clockwise: Bool
//    
//    func path(in rect: CGRect) -> Path {
////        let rotationAdjustment = Angle.degrees(90)
//        var path = Path()
//        
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.minY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: Clockwise)
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY), radius: rect.width / 2, startAngle: startAngle + .degrees(180), endAngle: endAngle + .degrees(180), clockwise: Clockwise)
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        
//        return path
//    }
//}


@Observable class ShapeSetGame{
    typealias Card = SetGame.Card
    
    @Published private var game: SetGame
    
    init(){
        game = ShapeSetGame.createSetGame()
    }
    
    var cards:[Card] {
        return game.cards
    }
    
    var faceUpCards: [Card]{
        return game.cards.filter({$0.isFaceUp})
    }
    
    var cardsAreLeftInDeck: Bool {
        return game.cards.filter({!$0.isFaceUp && $0.isMatched != true}).count != 0
    }
    
    var score: Int {
        return game.score
    }
    
    private static func createSetGame() -> SetGame{
        return SetGame()
    }
    

    // MARK: - User intents
    
    
    func newGame(){
        //withAnimation(.easeInOut(duration: Constants.animationDuration){
            //isVisible = false
            game = ShapeSetGame.createSetGame()
        //}
        }
    
    func drawCard() {
        game.drawCards(numberToDraw: Constants.numberToDraw)
    }
    
    func select(_ card: Card){
        game.select(card)
    }
    
    
    
    
    
    // MARK: - Properties
    
    static let shapes = ["♦️", "💊", "🦑"]
    //the <String> will need to be changed
    //private var game = createGame()
    private var isVisible = false
    
    
    
    // Change the <string>
//    static func createGame() -> SetGame{
//                                                // Change the Int.random to get a starting game size of 12 cards
//        SetGame<String>(numberOfPairsOfCards: Int.random(in: 2...shapes.count)) { shapes[$0] }
//    }
    
    // MARK: - Model access
    
    // Change <String>
//    var cards: Array<SetGame.Card>{
//        game.cards
//    }
    

    
    // MARK: - Constants
    private struct Constants {
        static let animationDuration = 0.5
        static let numberToDraw = 1
    }
}
