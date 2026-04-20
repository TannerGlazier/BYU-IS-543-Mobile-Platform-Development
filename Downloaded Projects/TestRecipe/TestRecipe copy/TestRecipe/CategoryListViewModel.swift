//
//  CategoryListViewModel.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/14/23.
//

import Foundation

class CategoryListViewModel: ObservableObject {
    @Published var categories: [RecipeCategory] = []

    init() {
        // Load categories or initialize with default ones
        loadCategories()
    }

    // Load categories (you can replace this with your actual data source)
    func loadCategories() {
        // Example: Load categories from a predefined list
        categories = [
            RecipeCategory(name: "Breakfast"),
            RecipeCategory(name: "Lunch"),
            RecipeCategory(name: "Dinner"),
            // Add more categories as needed
        ]
    }
}
