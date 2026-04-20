//
//  Ingredient.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/20/23.
//

import Foundation
import SwiftData

// This is a pretty fancy Ingredient structure.  The idea is to present
// multiple units for the same ingredient, like "71g butter (5 Tbsp.)".
// This structure also makes it easy to scale recipes because the quantity
// is a Decimal and we can do arithmetic on it easily.  The baker's percent
// is intended for use with bread recipes and the ratio is intended for
// recipes like a gingerbread spice mix (Lebkuchengewürz).  Again, using
// these two values we could scale the recipe quantities easily.

@Model
final class Ingredient {
    var sequence: Int
    var qualifier: String?
    var quantity: Decimal
    var unit: String
    var name: String
    var alternateQualifier: String?
    var alternateQuantity: Decimal?
    var alternateUnit: String?
    var bakersPercent: Decimal?
    var ratio: Int?
    var notes: String?

    init(sequence: Int, qualifier: String? = nil, quantity: Decimal, unit: String,
         name: String, alternateQualifier: String? = nil, alternateQuantity: Decimal? = nil,
         alternateUnit: String? = nil, bakersPercent: Decimal? = nil, ratio: Int? = nil,
         notes: String? = nil) {
        self.sequence = sequence
        self.qualifier = qualifier
        self.quantity = quantity
        self.unit = unit
        self.name = name
        self.alternateQualifier = alternateQualifier
        self.alternateQuantity = alternateQuantity
        self.alternateUnit = alternateUnit
        self.bakersPercent = bakersPercent
        self.ratio = ratio
        self.notes = notes
    }
}

extension Ingredient: Sequenced {
}

extension Ingredient {
    // These are the fields in the ingredient that we'll use for search.
    var asSearchString: String {
        """
        \(qualifier ?? "") \(quantity) \(unit) \(name) \
        \(alternateQualifier ?? "") \(alternateQuantity ?? 0) \
        \(alternateUnit ?? "") \(notes ?? "")
        """
        .lowercased()
    }
}

// For editing, I don't want to try to bind to SwiftData objects.  It's too
// messy.  Instead, we'll make a copy of the database data in Struct world,
// not Class world.  We'll edit these struct versions and then when the user
// says to save, we'll copy the information back into Class world where they
// can be stored in the SwiftData database.

struct IngredientStruct: Identifiable {
    var id = UUID()
    var sequence = 0
    var qualifier = ""
    var quantity = ""
    var unit = ""
    var name = ""
    var alternateQualifier = ""
    var alternateQuantity = ""
    var alternateUnit = ""
    var bakersPercent = ""
    var ratio = ""
    var notes = ""
}

extension IngredientStruct {
    var ingredient: Ingredient {
        Ingredient(
            sequence: sequence,
            qualifier: qualifier.orNil,
            quantity: quantity.decimal,
            unit: unit,
            name: name,
            alternateQualifier: alternateQualifier.orNil,
            alternateQuantity: alternateQuantity.decimalOrNil,
            alternateUnit: alternateUnit.orNil,
            bakersPercent: bakersPercent.decimalOrNil,
            ratio: ratio.intOrNil,
            notes: notes.orNil
        )
    }
}
