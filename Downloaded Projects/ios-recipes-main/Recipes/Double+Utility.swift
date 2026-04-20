//
//  Double+Utility.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/20/23.
//

import Foundation

extension Double {
    func isApproximately(_ value: Double) -> Bool {
        abs(self - value) < Constants.margin
    }

    var isEffectivelyZero: Bool {
        self.isZero || isApproximately(0)
    }

    private struct Constants {
        static let margin: Double = 0.0001
    }
}
