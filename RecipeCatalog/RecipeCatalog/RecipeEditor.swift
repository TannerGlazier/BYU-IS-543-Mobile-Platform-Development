//
//  RecipeEditor.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import SwiftUI
import SwiftData

struct RecipeEditor: View {
    let recipe: Recipe?
    
    private var editorTitle: String {
        recipe == nil ? "Add Recipe" : "Edit Recipe"
    }
    
    @State private var name = ""
    @State private var selectedInstruction = Recipe.recipeInstructions
    @State private var selectedCategory: RecipeCategory?
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \RecipeCategory.name) private var categories: [RecipeCategory]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Category", selection: $selectedCategory) {
                    Text("Select a category").tag(nil as RecipeCategory?)
                    ForEach(categories) { category in
                        Text(category.name).tag(category as RecipeCategory?)
                    }
                }
                
                Picker("Ingredients", selection: $selectedInstruction) {
                    ForEach(Recipe.recipeIngredient, id: \.self) { recipeIngredients in
                        Text(recipeIngredients).tag(recipeIngredients)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(editorTitle)
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            save()
                            dismiss()
                        }
                    }
                    // Require a category to save changes.
                    .disabled($selectedCategory.wrappedValue == nil)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if let recipe {
                    name = recipe.title
                    selectedInstruction = recipe.recipeInstructions
                    selectedCategory = recipe.category
                }
            }
        }
    }
    
    private func save() {
        if let recipe {
            recipe.title = name
            recipe.recipeInstructions = recipeInstructions
            recipe.category = selectedCategory
        } else {
            let newRecipe = Recipe(name: name, recipeInstructions: selectedInstruction)
            newRecipe.category = selectedCategory
            modelContext.insert(newRecipe)
        }
    }
}

#Preview("Add Recipe") {
    ModelContainerPreview(ModelContainer.sample) {
        RecipeEditor(recipe: nil)
    }
}

#Preview("Edit recipe") {
    ModelContainerPreview(ModelContainer.sample) {
        RecipeEditor(recipe: .cookie)
    }
}
