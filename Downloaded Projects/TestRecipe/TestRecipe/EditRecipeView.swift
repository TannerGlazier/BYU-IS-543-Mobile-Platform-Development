//
//  RecipeView.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
//

import SwiftUI

//                        // https://chat.openai.com/share/f0ec059f-7ac1-4b1c-9542-275dbd526334
struct EditRecipeView: View {
    @ObservedObject var viewModel: RecipeViewModel  // ViewModel instance
    @State var recipe: Recipe                        // Current recipe being edited
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Enter recipe title", text: $recipe.recipeTitle)
            }
            
            Section(header: Text("Author")) {
                TextField("Enter recipe author", text: $recipe.recipeAuthor)
            }
            
            Section(header: Text("Instructions")) {
                TextField("Enter recipe instructions", text: $recipe.recipeInstructions)
            }
            
            Section(header: Text("Ingredients")) {
                TextField("Enter recipe ingredients", text: $recipe.recipeIngredients)
            }
            
            Section(header: Text("Category")) {
                TextField("Enter recipe category", text: $recipe.recipeCategory)
            }
            
            Section(header: Text("Favorite")) {
                HStack {
                    Image(systemName: recipe.recipeFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.red)
                        .onTapGesture {
                            recipe.recipeFavorite.toggle()
                        }
                }
            }
            Section(header: Text("Notes")) {
                TextField("Enter recipe notes", text: $recipe.recipeNotes)
            }
            Section(header: Text("Date")) {
                DatePicker("", selection: $recipe.recipeDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
            }
            
            Section(header: Text("Time Required")) {
                DatePicker("", selection: $recipe.recipeTimeRequired, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
            }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .navigationTitle("Edit Recipe")
        .navigationBarItems(
            trailing:
                HStack {
                    Button("Save") {
                        viewModel.saveRecipe(recipe)
                        viewModel.shouldNavigateToDetailView = true
                    }
                }
        )
        .background(
            NavigationLink(destination: RecipeDetailView(recipe: recipe), isActive: $viewModel.shouldNavigateToDetailView, label: {EmptyView()})
        )
    }
}
