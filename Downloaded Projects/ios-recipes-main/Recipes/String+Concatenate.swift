//
//  String+Concatenate.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/20/23.
//

import Foundation

extension String {
    mutating func concatenate(withOptional joiner: String, _ string: String) {
        self = self.isEmpty ? string : "\(self)\(joiner)\(string)"
    }
}
