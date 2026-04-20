//
//  String+Capitalize.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/17/23.
//

import Foundation

// See https://stackoverflow.com/a/26306372/270486

extension String {
    var capitalizingFirstLetter: String {
        prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter
    }
}

extension String.SubSequence {
    var capitalizingFirstLetter: String {
        prefix(1).capitalized + dropFirst()
    }
}
