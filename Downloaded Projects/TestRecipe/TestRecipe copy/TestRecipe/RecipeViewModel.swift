//
//  RecipeViewModel.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []  // Published array of recipes
    @Published var shouldNavigateToDetailView = false
    @Published var favoriteRecipes: [Recipe] = []
    @Published var categories: [Category] = []

    // Instance of RecipeStorage to manage saving and loading
    private var recipeStorage = RecipeStorage()
    private var categoryStorage = CategoryStorage()
    

    // Constructor - loads recipes from storage
    init() {
        loadRecipes()
        loadCategories()
    }

    // Load recipes from storage
    func loadRecipes() {
        recipes = recipeStorage.getRecipes()
        updateFilteredRecipes()
    }

    // Save a given title
    func saveRecipe(_ recipe: Recipe) {
        // Check if the recipe already exists and update it
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index] = recipe
        } else {
            recipes.append(recipe)  // If new, append to the list
        }
        recipeStorage.saveRecipes(recipes)
        updateFilteredRecipes()
    }
    
    func loadCategories() {
        categories = categoryStorage.getCategories()
    }

    func saveCategories(_ categories: [Category]) {
        categoryStorage.saveCategories(categories)
    }
    
    // Update the filtered recipes based on the favorite flag
    private func updateFilteredRecipes(){
        favoriteRecipes = recipes.filter { $0.recipeFavorite }
    }
    
    // Get a recipe by its ID
    func getRecipeById(_ id: UUID) -> Recipe {
        recipes.first { $0.id == id } ?? Recipe(recipeTitle: "", recipeInstructions: "", recipeIngredients: "", recipeCategory: [], recipeFavorite: false, recipeAuthor: "", recipeDate: Date(), recipeTimeRequired: Date())
    }
}
