//
//  MainView.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = RecipeViewModel()  // ViewModel instance
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                // Favorite recipes section
                Section(header: Text("Favorite Recipes")) {
                    ForEach(viewModel.favoriteRecipes) { recipe in
                        NavigationLink(destination: EditRecipeView(viewModel: viewModel, recipe: recipe)) {
                            Text(recipe.recipeTitle)
                        }
                    }
                }
                
                // Loop through each Recipe and create a navigation link
                Section(header: Text("All Recipes")){
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            Text(recipe.recipeTitle)  // Display title text
                        }
                    }
                }
                
                // Categories section
                Section(header: Text("Categories")) {
                    ForEach(viewModel.categories) { category in
                        Text(category.categoryName)
                    }
                    NavigationLink("Add Category", destination: AddCategoryView(viewModel: viewModel))
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitle("Recipes")  // Navigation bar title
            // Navigation link for adding a new title
            .navigationBarItems(
                trailing:
                    NavigationLink("New Recipe", destination: EditRecipeView(viewModel: viewModel, recipe: Recipe(recipeTitle: "", recipeInstructions: "", recipeIngredients: "", recipeCategory: "", recipeFavorite: false, recipeAuthor: "", recipeDate: Date(), recipeTimeRequired: Date())))
            )
            .onAppear {
                viewModel.loadRecipes()
            }
        }
    }
    private var filteredFavoriteRecipes: [Recipe] {
            if searchText.isEmpty {
                return viewModel.favoriteRecipes
            } else {
                return viewModel.favoriteRecipes.filter {
                    $0.recipeTitle.lowercased().contains(searchText.lowercased())
                }
            }
        }

        private var filteredRecipes: [Recipe] {
            if searchText.isEmpty {
                return viewModel.recipes
            } else {
                return viewModel.recipes.filter {
                    $0.recipeTitle.lowercased().contains(searchText.lowercased())
                }
            }
        }
}

