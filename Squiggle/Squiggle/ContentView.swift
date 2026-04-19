//
//  ContentView.swift
//  Squiggle
//
//  Created by Tanner Glazier on 10/17/23.
//

import SwiftUI

let segments = [
    (CGPoint(x: 630, y: 540), CGPoint(x: 1124, y: 369), CGPoint(x: 897, y: 608)),
    (CGPoint(x: 270, y: 530), CGPoint(x: 523, y: 513),  CGPoint(x: 422, y: 420)),
    (CGPoint(x: 50, y: 400),  CGPoint(x: 96, y: 656),   CGPoint(x: 54, y: 583)),
    (CGPoint(x: 360, y: 120), CGPoint(x: 46, y: 220),   CGPoint(x: 191, y: 97)),
    (CGPoint(x: 890, y: 140), CGPoint(x: 592, y: 152),  CGPoint(x: 619, y: 315)),
    (CGPoint(x: 1040, y: 150),CGPoint(x: 953, y: 100),  CGPoint(x: 1009, y: 69))
]

struct Squiggle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard let lastSegment = segments.last else {
            return path
        }
        
        path.move(to: lastSegment.0)
        segments.forEach{ path.addCurve(to: $0, control1: $1, control2: $2)}
        
        path = path.offsetBy(
            dx: rect.minX - path.boundingRect.minX,
            dy: rect.minY - path.boundingRect.minY
        )
        
        let scale = rect.height / path.boundingRect.width
        let transform = CGAffineTransform(scaleX: scale, y: scale)
            .rotated(by: Double.pi / 2)
        
        path = path.applying(transform)
        
        return path.offsetBy(dx: rect.width, dy: 0)
    }
}

struct Diamond: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
//        let start = CGPoint(x: rect.minX, y: rect.midY)
//        let firstPoint = CGPoint(x: rect.midX, y: rect.minY)
//        let secondPoint = CGPoint(x: rect.maxX, y: rect.midY)
//        let end = CGPoint(x: rect.midX, y: rect.maxY)
        
//        var p = Path()
//        p.move(to: start)
//        p.addLine(to: firstPoint)
//        p.addLine(to: secondPoint)
//        p.addLine(to: end)
//        p.addLine(to: start)
//        p.addLine(to: firstPoint)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
//        // old route
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct Arc: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let Clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
//        let rotationAdjustment = Angle.degrees(90)
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.minY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: Clockwise)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY), radius: rect.width / 2, startAngle: startAngle + .degrees(180), endAngle: endAngle + .degrees(180), clockwise: Clockwise)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}

struct ContentView:View {
    var body: some View {
        HStack{
            Arc(startAngle: .degrees(0), endAngle: .degrees(180), Clockwise: true)
                .fill(.red.opacity(0.5))
                .stroke(.red, lineWidth: 10)

        }
        .frame(width:200, height: 200)
        HStack{
            Diamond()
                .fill(.green.opacity(0.5))
                .stroke(.green, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width:300, height: 500)
        }
        .frame(width:300, height: 500)
        
        HStack {
            ForEach(0..<3) { _ in
                ZStack {
                    Squiggle()
                        .opacity(0.25)
                    Squiggle().stroke(lineWidth: 8)
                }
                .aspectRatio(1/2, contentMode: .fit)
            }
            .rotationEffect(Angle(degrees: 180))
        }
            .foregroundStyle(.purple)
            .background(.pink)
            .padding()



        

    }
}










//struct ContentView: View {
//    var body:some View{
//        Path { path in
//            path.move(to:CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 500))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//        }.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .fill(.blue.opacity(0.5))
//        
//    }
//}





















//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        HStack {
//            ForEach(0..<3) { _ in
//                ZStack {
//                    Squiggle()
//                        .opacity(0.25)
//                    Squiggle().stroke(lineWidth: 8)
//                }
//                .aspectRatio(1/2, contentMode: .fit)
//            }
//            .rotationEffect(Angle(degrees: 180))
//        }
//            .foregroundStyle(.purple)
//            .background(.pink)
//            .padding()
//    }
//}




#Preview {
    ContentView()
}
