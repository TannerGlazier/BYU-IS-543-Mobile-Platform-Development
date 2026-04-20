//
//  RecipesListView.swift
//  TestRecipeAppForTanner
//
//  Created by Jackson Schow on 12/14/23.
//

import SwiftUI

struct RecipesListView: View {
    @ObservedObject var viewModel: RecipesViewModel
    @State private var showingAddRecipe = false

    var body: some View {
        List {
            ForEach(viewModel.recipes) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe, categories: categories(for: recipe))) {
                    Text(recipe.title)
                }
            }
            .onDelete(perform: deleteRecipe)
        }
        .navigationBarTitle("Recipes")
        .navigationBarItems(trailing: Button("Add Recipe") {
            showingAddRecipe = true
        })
        .sheet(isPresented: $showingAddRecipe) {
            AddRecipeView(viewModel: viewModel, isPresented: $showingAddRecipe)
        }
    }

    private func deleteRecipe(at offsets: IndexSet) {
        viewModel.recipes.remove(atOffsets: offsets)
        viewModel.saveRecipes()
    }

    private func categories(for recipe: Recipe) -> [Category] {
        viewModel.categories.filter { recipe.categoryIds.contains($0.id) }
    }
}
