//
//  Recipe.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    var title: String
    var author: String
    var date: String
    var recipeDescription: String
    var timeRequired: Int
    var servings: String
    var expertiseRequired: String
    var caloriesPerServing: String
    var category: RecipeCategory?
    var recipeIngredients: String
    var recipeInstructions: String
    var notes: String

    init(title: String, author: String, date: String, recipeDescription: String, timeRequired: Int, servings: String, expertiseRequired: String, caloriesPerServing: String, category: RecipeCategory? = nil, recipeIngredients: String, recipeInstructions: String, notes: String) {
        self.title = title
        self.author = author
        self.date = date
        self.recipeDescription = recipeDescription
        self.timeRequired = timeRequired
        self.servings = servings
        self.expertiseRequired = expertiseRequired
        self.caloriesPerServing = caloriesPerServing
        self.category = category
        self.recipeIngredients = recipeIngredients
        self.recipeInstructions = recipeInstructions
        self.notes = notes
    }
}
