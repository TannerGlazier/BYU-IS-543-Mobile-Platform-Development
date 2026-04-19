////
////  ContentView.swift
////  CalculatorUI
////
////  Created by Tanner Glazier on 9/18/23.
////
//
//import SwiftUI
//
//struct CalculatorView: View {
//    private var data:[Int] = Array(1...9)
//    private var signs:[String] = Array(arrayLiteral: "%", "X", "-", "+", "=")
//    private let colors: [Color] = [.red, .green, .blue, .yellow]
//    
//    private let adaptiveColumns = [
//        GridItem(.adaptive(minimum: 75))
//    ]
//    var body: some View {
//        NavigationView{
//            ScrollView{
//                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
//                    ForEach(data, id:\.self) {number in
//                        ZStack{
//                            Rectangle()
//                                .frame(width:75, height: 75)
//                                .foregroundStyle(colors[3])
//                                .cornerRadius(30)
//                            Text("\(number)")
//                                .foregroundStyle(.white)
//                                .font(.system(size: 80, weight:.medium, design: .rounded))
//
//                    }
//                    
//                }
//                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
//                    ForEach(signs, id:\.self) {symbol in
//                        ZStack{
//                            Rectangle()
//                                .frame(width:75, height: 75)
//                                .foregroundStyle(colors[0])
//                                .cornerRadius(30)
//                            Text("\(symbol)")
//                                .foregroundStyle(.white)
//                                .font(.system(size: 80, weight:.medium, design: .rounded))
//                        }
//                    }
//                    
//                }
//            }
//            .padding()
//            .navigationTitle("Grid Sample")
//            
//        }
//
//       
//        }
//    }
//
//#Preview {
//    CalculatorView()
//}










//import SwiftUI
//
//struct CalculatorView: View {
//    var body: some View {
//        NavigationView{
//            ScrollView{
//                LazyVGrid
//            }
//        }
//    }
//}
//#Preview {
//    CalculatorView()
//}


















//import SwiftUI
//
//struct CalculatorView: View {
//    private var numberData: [[String]] = [
//        ["1", "2", "3"],
//        ["4", "5", "6"],
//        ["7", "8", "9"],
//        ["0", ".", "="]
//    ]
//    
//    private var operators: [String] = ["%", "X", "-", "+"]
//    private var equals: [String] = ["="]
//    
//    private let colors: [Color] = [.red, .green, .blue, .yellow]
//    
//    private let adaptiveColumns: [GridItem] = [
//        GridItem(.adaptive(minimum: 75)),
//        GridItem(.adaptive(minimum: 75)),
//        GridItem(.adaptive(minimum: 75)),
//        GridItem(.adaptive(minimum: 75))
//    ]
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))], spacing: 20) {
//                ForEach(operators, id: \.self) { symbol in
//                    ZStack {
//                        Rectangle()
//                            .frame(width: 75, height: 75)
//                            .foregroundColor(colors[0])
//                            .cornerRadius(30)
//                        Text("\(symbol)")
//                            .foregroundColor(.white)
//                            .font(.system(size: 80, weight: .medium, design: .rounded))
//                    }
//                }
//            }
//                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
//                    ForEach(0..<numberData.count, id: \.self) { row in
//                        ForEach(numberData[row], id: \.self) { number in
//                            ZStack {
//                                Rectangle()
//                                    .frame(width: 75, height: 75)
//                                    .foregroundColor(colors[3])
//                                    .cornerRadius(30)
//                                Text("\(number)")
//                                    .foregroundColor(.white)
//                                    .font(.system(size: 80, weight: .medium, design: .rounded))
//                            }
//                        }
//                    }
//                }
//
//            }
//            .padding()
//            .navigationTitle("33 x 265 = 8,745")
//        }
//    }
//}
//
//struct CalculatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorView()
//    }
//}











import SwiftUI

struct CalculatorView: View {
    
    @State private var soundPlayer = SoundPlayer()
    private var numberData: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["0", ".", "C"]
    ]
    
    private var operators: [String] = ["%", "X", "-", "+"]
    
    private let adaptiveColumns: [GridItem] = [
        GridItem(.adaptive(minimum: 75)),
        GridItem(.adaptive(minimum: 75)),
        GridItem(.adaptive(minimum: 75)),
        GridItem(.adaptive(minimum: 75))
    ]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Text("33 x 265 = 8,745")
                    .font(.system(size: 45, weight: .medium, design: .rounded))
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))], spacing: 20) {
                    ForEach(operators, id: \.self) { symbol in
                        ZStack {
                            Rectangle()
                                .frame(width: 75, height: 75)
                                .foregroundColor(.red)
                                .cornerRadius(30)
                            Text("\(symbol)")
                                .foregroundColor(.white)
                                .font(.system(size: 80, weight: .medium, design: .rounded))
                        }
                    }
                }
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(0..<numberData.count, id: \.self) { row in
                        ForEach(numberData[row], id: \.self) { number in
                            ZStack {
                                Rectangle()
                                    .frame(width: 75, height: 75)
                                    .foregroundColor(number == "." || number == "C" ? .blue : .yellow)
                                    .cornerRadius(30)
                                Text("\(number)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 80, weight: .medium, design: .rounded))
                            }
                        }
                    }
                }
                LazyVGrid(columns: adaptiveColumns, spacing: 8000) {
                    ZStack {
                        Rectangle()
                            .frame(width: 175, height: 75)
                            .foregroundColor(.green)
                            .cornerRadius(30)
                            
                        Text("=")
                            .foregroundColor(.white)
                            .font(.system(size: 50, weight: .medium, design: .rounded))
                    }
                }
                .padding(.horizontal, 75)
            }
        }
        .padding()
        }
    }


struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
