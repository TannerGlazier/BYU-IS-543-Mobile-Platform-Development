//
//  RecipeDetailView.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/14/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @ObservedObject var viewModel = RecipeViewModel()

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                HStack{
                    Text(recipe.recipeTitle)
                    Spacer()
                    Image(systemName: recipe.recipeFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                }
            }
            Section(header: Text("Author")) {
                Text(recipe.recipeAuthor)
            }
            Section(header: Text("Instructions")) {
                Text(recipe.recipeInstructions)
            }
            Section(header: Text("Ingredients")) {
                Text(recipe.recipeIngredients)
            }
            Section(header: Text("Category")) {
                ForEach(recipe.recipeCategories) { category in
                    Text(category.categoryName)
                }
            }
            Section(header: Text("Date")) {
                Text(formattedDate(recipe.recipeDate))
            }
            Section(header: Text("Time Required")) {
                Text(formattedTime(recipe.recipeTimeRequired))
            }
        }
        .navigationTitle("Recipe Details")
        .navigationBarItems(
            trailing:
                NavigationLink(destination: EditRecipeView(viewModel: RecipeViewModel(), recipe: recipe)) {
                    Text("Edit")
                }
        )
        .onAppear{
            viewModel.shouldNavigateToDetailView = false
        }
    }

    // Helper function to format the date
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }

    // Helper function to format the time
    private func formattedTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}



//    .navigationBarItems(
//        trailing:
//            Image(systemName: recipe.recipeFavorite ? "heart.fill" : "heart")
//                .resizable()
//                .frame(width: 30, height: 30)
//                .foregroundColor(.red)
//    )
