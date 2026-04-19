// HW2 - Tanner Glazier
//
//  ContentView.swift
//  hw2
//
//  Created by Tanner Glazier on 9/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var fibonacciValue = "1"
    @State private var fibonacciResult: [Int] = []
    
    @State var factorialValue:String = "1"
    @State private var factorialResult: Int?
    
    @State var sumLower: String = "1"
    @State var sumUpper: String = "100"
    @State var sumResult: Int?
    
    @State var numberCents:String = "1"
    @State var coinCounts:[String] = []
    
    var body: some View {
        VStack {
            HStack{
                Text("Fibonacci Sequence")
                TextField("Fibonacci Length", text: $fibonacciValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Compute"){
                    if let input = Int(fibonacciValue){
                        fibonacciResult = calculateFibonacci(count: input)
                    }
                }
            }
            .padding(.horizontal, 20)
            HStack{
                List(fibonacciResult.indices, id:\.self) {index in
                    Text("\(index + 1): \(fibonacciResult[index])")
                }
            }
        
            HStack{
                Text("Factorial")
                TextField("Factorial Number", text: $factorialValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Compute"){
                    if let input = Int(factorialValue), input > 0 {
                        factorialResult = calculateFactorial(n: input)
                    }
                }
            }
            .padding(.horizontal, 20)
            HStack{
                if let result = factorialResult{
                    Text("\(result)")
                }
            }
            
            HStack{
                Text("Sum of Integers")
                TextField("Lower value", text: $sumLower)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Upper Value", text: $sumUpper)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Compute"){
                    if let lower = Int(sumLower), let upper = Int(sumUpper){
                        sumResult = calculateSum(lower: lower, upper: upper)
                    }
                }
            }
            .padding(.horizontal, 20)
            HStack{
                if let result = sumResult{
                    Text("\(result)")
                }
            }
            
            HStack{
                Text("Number of cents")
                TextField("Number of Cents", text: $numberCents)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Compute"){
                    if let amount = Int(numberCents), amount > 0 {
                        coinCounts = calculateCents(amount : amount)
                    }
                }
            }
            .padding(.horizontal, 20)
            HStack{
                if !coinCounts.isEmpty{
                    ForEach(coinCounts, id:\.self) { coinCounts in
                        Text(coinCounts)
                    }
                }
            }
        }
    }
    
    func calculateFibonacci(count: Int) -> [Int] {
        if count <= 0 {
            return []
        } else if count == 1 {
            return [0]
        } else if count == 2 {
            return [0, 1]
        } else {
            var sequence = [0, 1]
            for _ in 2..<count {
                let nextValue = sequence[sequence.count - 1] + sequence[sequence.count - 2]
                sequence.append(nextValue)
            }
            return sequence
        }
    }
        
        
    func calculateFactorial(n: Int) -> Int {
        if n == 1 {
            return 1
        } else {
            return n * calculateFactorial(n: n - 1)
        }
    }
    
    func calculateSum(lower: Int, upper: Int) -> Int{
        var sum = 0
        for number in lower ... upper {
            sum += number
        }
        return sum
    }
    
    func calculateCents(amount: Int) -> [String] {
        var remainingAmount = amount
        var coins: [String] = []
        let coinValue = [(25, "Quarter"), (10,"Dime"), (5, "Nickel"), (1, "Penny")]
        
        for (coinValue, coinName) in coinValue {
            if remainingAmount >= coinValue {
                let count = remainingAmount / coinValue
                if count > 1 {
                    coins.append("\(count) \(coinName)s")
                } else {
                    coins.append("\(count) \(coinName)")
                }
                remainingAmount %= coinValue
            }
        }
        return coins
    }
}

#Preview {
    ContentView()
}
