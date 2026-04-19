//
//  RecipeCategory.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import Foundation
import SwiftData

@Model
final class RecipeCategory{
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .cascade, inverse: \Recipe.category)
    var recipes = [Recipe]()
    
    init(name: String) {
        self.name = name
    }
}
