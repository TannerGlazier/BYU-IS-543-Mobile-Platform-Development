//
//  CalculatorViewModel.swift
//  HW6 Calculator
//
//  Created by Stephen Liddle on 9/26/23.
//

import Foundation

@Observable class CalculatorEngine {
    
    // MARK: - Constants
    
    private struct Constants {
        static let decimal = OperationSymbol.decimal.rawValue
        static let defaultDisplayText = OperationSymbol.zero.rawValue
        static let errorDisplay = "Error"
        static let largeThreshold = 1_000_000_000.0
        static let maximumFractionDigits = 8
    }
    
    // MARK: - Properties

    var preferences = Preferences()
    
    private var calculator = CalculatorBrain()
    private var decimalFormatter = NumberFormatter()
    private var scientificFormatter = NumberFormatter()
    private var soundPlayer = SoundPlayer()
    private var textBeingEditied: String? = Constants.defaultDisplayText
    
    // MARK: - Initialization
    
    init() {
        decimalFormatter.numberStyle = .decimal
        decimalFormatter.maximumFractionDigits = Constants.maximumFractionDigits
        
        
        scientificFormatter.numberStyle = .scientific
        scientificFormatter.maximumFractionDigits = Constants.maximumFractionDigits
    }
    
    // MARK: - Model access
    var activeSymbol: OperationSymbol? {
        calculator.pendingSymbol    
    }
    var clearSymbol: String{
        if isClear {
            OperationSymbol.clear.rawValue
        } else{
            OperationSymbol.allClear.rawValue
        }
    }
    var displayText: String{
        if let text = textBeingEditied{
            text
            
        } else if let value = calculator.accumulator {
            formatted(number: value)
        } else if let value = calculator.pendingLeftOperand {
            formatted(number: value)
        } else {
            Constants.errorDisplay
        }
    }
    

    // MARK: - User intents

    func handleButtonTap(for buttonSpec: ButtonSpec) {
        if preferences.soundIsEnabled {
            Task {
                await soundPlayer.playSound(named: "Click.mp3")
            }
        }
        switch buttonSpec.type {
        case .compute:
            handleOperationTap(symbol: buttonSpec.symbol)
        case .utility:
            if buttonSpec.symbol == .clear {
                handleClearTap()
            } else{
                handleOperationTap(symbol: buttonSpec.symbol)
            }
        case .number, .doubleWide:
            handleNumericTap(digit: buttonSpec.symbol.rawValue)
        }
    }
    
    // MARK: - Private helpers
    
    private func formatted(number: Double) -> String {
        formatter(for: number).string(from:   NSNumber(value: number)) ?? Constants.errorDisplay
    }

    private func formatter(for value: Double) -> NumberFormatter {
        value > Constants.largeThreshold ? scientificFormatter : decimalFormatter
    }
    private func handleClearTap(){
        if isClear {
            calculator.clearAccumulator()
            
            if calculator.pendingLeftOperand != nil {
                textBeingEditied = nil
            } else {
                textBeingEditied = Constants.defaultDisplayText
            }
        } else {
            calculator.clearAll()
            textBeingEditied = Constants.defaultDisplayText
        }
    }
    
    private func handleNumericTap(digit: String){
        if let text = textBeingEditied {
            if digit == Constants.decimal && text.contains(digit){
                // ignore extra tap on decimal button
                return
            }
            if digit != Constants.decimal && text == Constants.defaultDisplayText {
                textBeingEditied = digit
            } else {
                textBeingEditied = text + digit
            }
            
        } else {
            textBeingEditied = digit
        }
        if let updatedText = textBeingEditied {
            if updatedText.hasPrefix(Constants.decimal) {
                textBeingEditied = Constants.defaultDisplayText + updatedText
            }
            calculator.setAccumulator(Double(updatedText))
        }
        
    }
    
    private func handleOperationTap(symbol: OperationSymbol){
        if calculator.accumulator != nil {
            calculator.performOperation(symbol: symbol)
            textBeingEditied = nil
        }
    }
    
    private var isClear: Bool {
        if let text = textBeingEditied, text != Constants.defaultDisplayText {
            true
        } else{
            false
        }
    }
    
}
