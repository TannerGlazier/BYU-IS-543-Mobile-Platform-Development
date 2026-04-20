//
//  String+Utility.swift
//  Recipes
//
//  Created by Stephen Liddle on 12/4/23.
//

import Foundation

extension String {
    var decimal: Decimal {
        Decimal(string: self) ?? 0
    }

    var decimalOrNil: Decimal? {
        Decimal(string: self)?.orNil
    }

    var intOrNil: Int? {
        Int(self)?.orNil
    }

    var orNil: String? {
        self.isEmpty ? nil : self
    }

    var specified: String {
        self == Constants.unspecified ? "" : self
    }
}
