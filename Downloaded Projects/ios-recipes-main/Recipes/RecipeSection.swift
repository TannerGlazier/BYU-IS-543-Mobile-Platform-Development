//
//  RecipeSection.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/20/23.
//

import Foundation
import SwiftData

// Each RecipeSection may have a header, may have some text (in markdown format)
// and may have zero or more ingredients.

@Model
final class RecipeSection {
    var sequence: Int
    @Relationship(deleteRule: .cascade)
    var ingredients: [Ingredient]
    var header: String?
    var text: String?

    init(sequence: Int, ingredients: [Ingredient] = [], header: String? = nil, text: String? = nil) {
        self.sequence = sequence
        self.ingredients = ingredients
        self.header = header
        self.text = text
    }
}

extension RecipeSection: Sequenced {
}

extension RecipeSection {
    var asSearchString: String {
        var result = "\(header ?? "") \(text ?? "") "

        ingredients.forEach {
            result += $0.asSearchString
        }

        return result.lowercased()
    }
}

// For editing, I don't want to try to bind to SwiftData objects.  It's too
// messy.  Instead, we'll make a copy of the database data in Struct world,
// not Class world.  We'll edit these struct versions and then when the user
// says to save, we'll copy the information back into Class world where they
// can be stored in the SwiftData database.

struct RecipeSectionStruct: Identifiable {
    var id = UUID()
    var sequence = 0
    var ingredients = [IngredientStruct]()
    var header = ""
    var text = ""
}
