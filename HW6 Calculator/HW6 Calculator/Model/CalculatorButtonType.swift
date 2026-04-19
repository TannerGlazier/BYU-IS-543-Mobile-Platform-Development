//
//  CalculatorButtonType.swift
//  HW6 Calculator
//
//  Created by Tanner Glazier on 9/27/23.
//

import Foundation

enum CalculatorButtonType {
    case utility
    case compute
    case number
    case doubleWide
}

enum OperationSymbol: string, Hashable {
    case divide = "/"
    case multiply = "*"
}

typealias ButtonSpec =
