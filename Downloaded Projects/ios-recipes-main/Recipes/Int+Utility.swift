//
//  Int+Utility.swift
//  Recipes
//
//  Created by Stephen Liddle on 12/4/23.
//

import Foundation

extension Int {
    var orNil: Int? {
        self == .zero ? nil : self
    }
}
