//
//  RecipeView.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
//

import SwiftUI

//struct RecipeView: View {
//    @ObservedObject var viewModel: RecipeViewModel  // ViewModel instance
//    @State var recipe: Recipe                        // Current recipe being edited
//    
//    
//    
//    var body: some View {
//        VStack {
//            
//            ScrollView {
//                    TextField("Enter recipe title", text: $recipe.recipeTitle)  // Text field for title
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    Section("Author"){
//                        TextField("Enter recipe author", text: $recipe.recipeAuthor)  // Text field for title
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                    }
//                    TextField("Enter recipe instructions", text: $recipe.recipeInstructions)  // Text field for title
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    TextField("Enter recipe ingredients", text: $recipe.recipeIngredients)  // Text field for title
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                    TextField("Enter recipe category", text: $recipe.recipeCategory)  // Text field for title
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        
//                        // https://chat.openai.com/share/f0ec059f-7ac1-4b1c-9542-275dbd526334
//                        Image(systemName: recipe.recipeFavorite ? "heart.fill" : "heart")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .foregroundColor(.red)
//                            .onTapGesture {
//                                // Toggle the recipeFavorite property when the heart is tapped
//                                recipe.recipeFavorite.toggle()
//                            }
//                        DatePicker("Select date", selection: $recipe.recipeDate, displayedComponents: [.date])
//                            .datePickerStyle(WheelDatePickerStyle())
//                            .padding()
//                
//                        DatePicker("Select Time Required", selection: $recipe.recipeTimeRequired, displayedComponents: [.hourAndMinute])
//                            .datePickerStyle(WheelDatePickerStyle())
//                            .padding()
//
//                        Button("Save") {
//                            viewModel.saveRecipe(recipe)  // Save the recipe on button press
//                        }
//                        .padding()
//            }
//        
//        }
//    }
//}
//

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
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            // Categories section
            Section(header: Text("Categories")) {
                ForEach(viewModel.categories) { category in
                    Toggle(category.categoryName, isOn: Binding(
                        get: {
                            recipe.recipeCategories.contains(category)
                        },
                        set: { isSelected in
                            if isSelected {
                                recipe.recipeCategories.append(category)
                            } else {
                                recipe.recipeCategories.removeAll { $0.id == category.id }
                            }
                        }
                    ))
                }
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
            
            Section(header: Text("Date")) {
                DatePicker("", selection: $recipe.recipeDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
            }
            
            Section(header: Text("Time Required")) {
                DatePicker("", selection: $recipe.recipeTimeRequired, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
            }
            //.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
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
