//
//  RecipeModel.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
import Foundation

struct Recipe: Codable, Identifiable {
    var id = UUID()           // Unique identifier for each title
    var recipeTitle: String     // Text of the title
    var recipeInstructions: String
    var recipeIngredients: String
    var recipeCategory: [Category] // an array of categories
    var recipeFavorite: Bool
    var recipeAuthor: String
    var recipeDate: Date
    var recipeTimeRequired: Date
    
}

class RecipeStorage {
    private var recipes: [Recipe] = []  // Array to store recipes
    private let fileURL: URL          // URL for the file to store data

    // Constructor - initializes file URL and loads titles
    init() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = documentsDirectory.appendingPathComponent("recipes.json")
        loadRecipes()
    }

    // Load titles from local file
    func loadRecipes() {
        do {
            let data = try Data(contentsOf: fileURL)
            recipes = try JSONDecoder().decode([Recipe].self, from: data)
        } catch {
            print("Error loading recipes: \(error)")
            recipes = []
        }
    }

    // Save titles to local file
    func saveRecipes(_ recipes: [Recipe]) {
        do {
            let data = try JSONEncoder().encode(recipes)
            try data.write(to: fileURL)
        } catch {
            print("Error saving recipes: \(error)")
        }
    }

    // Getter for recipes
    func getRecipes() -> [Recipe] {
        return recipes
    }
}
