//
//  RecipeDetailView.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import SwiftUI
import SwiftData

struct RecipeDetailView: View {
    var recipe: Recipe?
    @State private var isEditing = false
    @State private var isDeleting = false
    @Environment(\.modelContext) private var modelContext
    @Environment(NavigationContext.self) private var navigationContext

    var body: some View {
        if let recipe {
            RecipeDetailContentView(recipe: recipe)
                .navigationTitle("\(recipe.name)")
                .toolbar {
                    Button { isEditing = true } label: {
                        Label("Edit \(recipe.name)", systemImage: "pencil")
                            .help("Edit the recipe")
                    }
                    
                    Button { isDeleting = true } label: {
                        Label("Delete \(recipe.name)", systemImage: "trash")
                            .help("Delete the recipe")
                    }
                }
                .sheet(isPresented: $isEditing) {
                    RecipeEditor(recipe: recipe)
                }
                .alert("Delete \(recipe.name)?", isPresented: $isDeleting) {
                    Button("Yes, delete \(recipe.name)", role: .destructive) {
                        delete(recipe)
                    }
                }
        } else {
            ContentUnavailableView("Select an recipe", systemImage: "list.bullet.rectangle.portrait")
        }
    }
    
    private func delete(_ recipe: Recipe) {
        navigationContext.selectedRecipe = nil
        modelContext.delete(recipe)
    }
}

private struct RecipeDetailContentView: View {
    let recipe: Recipe

    var body: some View {
        VStack {
            EmptyView()
            List {
                HStack {
                    Text("Category")
                    Spacer()
                    Text("\(recipe.category?.name ?? "")")
                }
                HStack {
                    Text("Instructions")
                    Spacer()
                    Text("\(recipe.recipeIngredients)")
                }
            }
        }
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        RecipeDetailView(recipe: .cookie)
            .environment(NavigationContext())
    }
}
