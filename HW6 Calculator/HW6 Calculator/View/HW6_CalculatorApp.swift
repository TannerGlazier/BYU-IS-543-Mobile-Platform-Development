//
//  HW6_CalculatorApp.swift
//  HW6 Calculator
//
//  Created by Tanner Glazier on 9/27/23.
//

import SwiftUI

@main
struct HW6_CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView(calculatorViewModel: CalculatorViewModel())
        }
    }
}
