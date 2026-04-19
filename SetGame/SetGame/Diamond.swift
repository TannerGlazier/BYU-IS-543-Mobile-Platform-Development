//
//  Diamond.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/24/23.
//

import SwiftUI

struct Diamond: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
                
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        return path
    }
}

//struct DiamondView:View {
//    var body: some View {
//        HStack{
//            Diamond()
//                .fill(.green.opacity(0.5))
//                .stroke(.green, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//                .frame(width:300, height: 500)
//        }
//        .frame(width:300, height: 500)
//    }
//}





//#Preview {
//    DiamondView()
//}


