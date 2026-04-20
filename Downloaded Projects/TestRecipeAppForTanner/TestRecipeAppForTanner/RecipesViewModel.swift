//
//  RecipesViewModel.swift
//  TestRecipeAppForTanner
//
//  Created by Jackson Schow on 12/14/23.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var categories: [Category] = []

    init() {
        loadRecipes()
        loadCategories()
    }

    // Saving and Loading Recipes
    func saveRecipes() {
        do {
            let filePath = documentDirectory().appendingPathComponent("recipes.json")
            let data = try JSONEncoder().encode(recipes)
            try data.write(to: filePath)
        } catch {
            print("Error saving recipes: \(error)")
        }
    }

    private func loadRecipes() {
        let filePath = documentDirectory().appendingPathComponent("recipes.json")
        do {
            let data = try Data(contentsOf: filePath)
            recipes = try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            print("Error loading recipes: \(error)")
        }
    }

    // Saving and Loading Categories
    func saveCategories() {
        do {
            let filePath = documentDirectory().appendingPathComponent("categories.json")
            let data = try JSONEncoder().encode(categories)
            try data.write(to: filePath)
        } catch {
            print("Error saving categories: \(error)")
        }
    }

    private func loadCategories() {
        let filePath = documentDirectory().appendingPathComponent("categories.json")
        do {
            let data = try Data(contentsOf: filePath)
            categories = try JSONDecoder().decode([Category].self, from: data)
        } catch {
            print("Error loading categories: \(error)")
        }
    }

    // Utility function
    private func documentDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    // Add Recipe
    func addRecipe(title: String, categoryIds: [String]) {
        let newRecipe = Recipe(title: title, categoryIds: categoryIds)
        recipes.append(newRecipe)
        saveRecipes()
    }

    // Add Category
    func addCategory(name: String) {
        let newCategory = Category(name: name)
        categories.append(newCategory)
        saveCategories()
    }
}
