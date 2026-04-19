//
//  Item.swift
//  Recipes
//
//  Created by Tanner Glazier on 11/25/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var title: String
    var author: String
    // this will need to be changed into a date
    var createDate: String
    var recipeDescription: String
    var timeRequired: Int
    var servings: String
    var expertiseRequired: String
    var caloriesPerServing: String
//These 3 will need to be made into arrays
    var recipeCategories: String
    var recipeIngredients: String
    var recipeInstructions: String
    
    var notes: String
    
    init(title: String, author: String, createDate: String, recipeDescription: String, timeRequired: Int, servings: String, expertiseRequired: String, caloriesPerServing: String, recipeCategories: String, recipeIngredients: String, recipeInstructions: String, notes: String) {
        self.title = title
        self.author = author
        self.createDate = createDate
        self.recipeDescription = recipeDescription
        self.timeRequired = timeRequired
        self.servings = servings
        self.expertiseRequired = expertiseRequired
        self.caloriesPerServing = caloriesPerServing
        self.recipeCategories = recipeCategories
        self.recipeIngredients = recipeIngredients
        self.recipeInstructions = recipeInstructions
        self.notes = notes
    }
}
