//
//  Squiggle.swift
//  SetGame
//
//  Created by Tanner Glazier on 10/24/23.
//

import SwiftUI

struct Squiggle: Shape {
    
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(
            x: SquiggleConstants.startXMultipier * rect.maxX,
            y: rect.midY)
        let firstPoint = CGPoint(
            x: rect.midX,
            y: SquiggleConstants.midYMuliplier * rect.maxY)
        let secondPoint = CGPoint(
            x: (1 - SquiggleConstants.startXMultipier) * rect.maxX,
            y: rect.midY)
        let thirdPoint = CGPoint(
            x: rect.midX,
            y: (1 - SquiggleConstants.midYMuliplier) * rect.maxY)
        
        var path = Path()
        
        path.move(to: start)
        path.addQuadCurve(to: firstPoint, control: CGPoint(
            x: SquiggleConstants.quadCurveControlXMultiplier * rect.maxX,
            y: SquiggleConstants.quadCurveControlYMultiplier * rect.maxY))
        path.addCurve(to: secondPoint,
                   control1: CGPoint(
                    x: SquiggleConstants.cubicCurveControlOneXMultiplier * rect.maxX,
                    y: SquiggleConstants.cubicCurveControlOneYMultiplier * rect.maxY),
                   control2: CGPoint(
                    x: SquiggleConstants.cubicCurveControlTwoXMultiplier * rect.maxX,
                    y: SquiggleConstants.cubicCurveControlTwoYMultiplier * rect.maxY))
        path.addQuadCurve(to: thirdPoint, control: CGPoint(
            x: (1 - SquiggleConstants.quadCurveControlXMultiplier) * rect.maxX,
            y: (1 - SquiggleConstants.quadCurveControlYMultiplier) * rect.maxY))
        path.addCurve(to: start,
                   control1: CGPoint(
                    x: (1 - SquiggleConstants.cubicCurveControlOneXMultiplier) * rect.maxX,
                    y: (1 - SquiggleConstants.cubicCurveControlOneYMultiplier) * rect.maxY),
                   control2: CGPoint(
                    x: (1 - SquiggleConstants.cubicCurveControlTwoXMultiplier) * rect.maxX,
                    y: (1 - SquiggleConstants.cubicCurveControlTwoYMultiplier) * rect.maxY))

        return path
    }

    private struct SquiggleConstants  {
        static let startXMultipier: CGFloat = 0.03
        static let midYMuliplier: CGFloat = 0.18
        
        static let quadCurveControlXMultiplier: CGFloat = 0.05
        static let quadCurveControlYMultiplier: CGFloat = -0.15
        
        static let cubicCurveControlOneXMultiplier: CGFloat = 0.8
        static let cubicCurveControlOneYMultiplier: CGFloat = 0.5
        static let cubicCurveControlTwoXMultiplier: CGFloat = 1.04
        static let cubicCurveControlTwoYMultiplier: CGFloat = -0.55
    }
}

// I had trouble getting the code that you provided to work, so I found another implementation of it.

//struct Squiggle_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            Rectangle().frame(width: 300, height: 125, alignment: .center)
//            Squiggle().stroke(.red, lineWidth: 3).frame(width: 300, height: 125, alignment: .center)
//        }
//    }
//}
//
//
//
////import SwiftUI
////
//let segments = [
//    (CGPoint(x: 630, y: 540), CGPoint(x: 1124, y: 369), CGPoint(x: 897, y: 608)),
//    (CGPoint(x: 270, y: 530), CGPoint(x: 523, y: 513),  CGPoint(x: 422, y: 420)),
//    (CGPoint(x: 50, y: 400),  CGPoint(x: 96, y: 656),   CGPoint(x: 54, y: 583)),
//    (CGPoint(x: 360, y: 120), CGPoint(x: 46, y: 220),   CGPoint(x: 191, y: 97)),
//    (CGPoint(x: 890, y: 140), CGPoint(x: 592, y: 152),  CGPoint(x: 619, y: 315)),
//    (CGPoint(x: 1040, y: 150),CGPoint(x: 953, y: 100),  CGPoint(x: 1009, y: 69))
//]
//
//struct Squiggle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        guard let lastSegment = segments.last else {
//            return path
//        }
//        
//        path.move(to: lastSegment.0)
//        segments.forEach{ path.addCurve(to: $0, control1: $1, control2: $2)}
//        
//        path = path.offsetBy(
//            dx: rect.minX - path.boundingRect.minX,
//            dy: rect.minY - path.boundingRect.minY
//        )
//        
//        let scale = rect.height / path.boundingRect.width
//        let transform = CGAffineTransform(scaleX: scale, y: scale)
//            .rotated(by: Double.pi / 2)
//        
//        path = path.applying(transform)
//        
//        return path//.offsetBy(dx: rect.width, dy: 0)
//    }
//}
//
//struct SquiggleView:View {
//    var body: some View {
//        HStack {
//            //ForEach(0..<3) { _ in
//                ZStack {
//                    Squiggle().stroke(.red, lineWidth: 3).frame(width: 300, height: 125, alignment: .center)
//               // }
//                //.aspectRatio(1/2, contentMode: .fit)
//            }
//            //.rotationEffect(Angle(degrees: 180))
//        }
//            .foregroundStyle(.purple)
//            .background(.pink)
//            .padding()
//
//    }
//}
//
//#Preview {
//    SquiggleView()
//}
        
