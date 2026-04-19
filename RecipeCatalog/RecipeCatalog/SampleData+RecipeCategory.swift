//
//  SampleData+RecipeCategory.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import Foundation
import SwiftData

extension RecipeCategory {
    static let breakfast = RecipeCategory(name: "Breakfast")
    static let snack = RecipeCategory(name: "Snack")
    static let dessert = RecipeCategory(name: "Dessert")
    static let dinner = RecipeCategory(name: "Dinner")

    static func insertSampleData(modelContext: ModelContext) {

        modelContext.insert(breakfast)
        modelContext.insert(snack)
        modelContext.insert(dessert)
        modelContext.insert(dinner)
        

        modelContext.insert(Recipe.cereal)
        modelContext.insert(Recipe.trailMix)
        modelContext.insert(Recipe.cookie)
        modelContext.insert(Recipe.Hamburger)
        
        Recipe.cereal.category = breakfast
        Recipe.trailMix.category = snack
        Recipe.cookie.category = dessert
        Recipe.Hambuger.category = dinner
        
    }
    
    static func reloadSampleData(modelContext: ModelContext) {
        do {
            try modelContext.delete(model: RecipeCategory.self)
            insertSampleData(modelContext: modelContext)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

