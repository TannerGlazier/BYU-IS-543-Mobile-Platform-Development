//
//  Item.swift
//  SwiftData MVVM Demo
//
//  Created by Stephen Liddle on 12/6/23.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    var title: String

    @Relationship(deleteRule: .cascade)
    var dependentItems: [DependentItem] = []

    // @Relationship(deleteRule: .nullify) // This is the default, so it's not necessary to list it
    var independentItems: [Category] = []

    init(title: String, dependentItems: [DependentItem], independentItems: [Category]) {
        self.title = title
        
        self.dependentItems = dependentItems
        self.independentItems = independentItems
    }
}
