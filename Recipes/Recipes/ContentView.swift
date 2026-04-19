//
//  ContentView.swift
//  Recipes
//
//  Created by Tanner Glazier on 11/25/23.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var title = ""

    var body: some View {
        NavigationSplitView {
            List {
                Section(header: Text("Favorites").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)) {
                    // ToDo
                }
                Section(header: Text("Recipes").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)) {
                    ForEach(items) { item in
                        NavigationLink {
                            TextField("Recipe Name", text: $title)
                            ScrollView {
                                VStack {

                                    Markdown {
                                        item.title
                                    }
                                    .padding()
                                    Markdown {
                                        item.recipeIngredients
                                    }
                                    .padding()
                                    Markdown {
                                        item.recipeInstructions
                                    }
                                    .padding()
                                }
                            }
                        } label: {
                            Text(item.title)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: initializeRecipes) {
                        Label("Initialize", systemImage: "folder.badge.plus")
                    }
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

//    private var AddRecipeDetails: some View {
//        
//    }
    private func addItem() {
        withAnimation {
            let newItem = Item(title: "Recipe Title", author: "Author", createDate: "12/4/2023", recipeDescription: "This is some text to get a recipe started", timeRequired: 50, servings: "30 Servings",  expertiseRequired: "Mixing bowl", caloriesPerServing: "50 per cookie", recipeCategories: "Main Dish", recipeIngredients: "Ingredients list", recipeInstructions: "instructions", notes: "Here are some notes about the recipe")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
    
    private func initializeRecipes() {
        withAnimation {
//        for recipe in sampleRecipes {
//            modelContext.insert(recipe)
//        }
            if let recipes = loadJson(filename: "SampleData"){
                for recipe in recipes {
                    modelContext.insert(
                        Item(
                            title: recipe.title,
                            author: "",
                            createDate: "",
                            recipeDescription: "",
                            timeRequired: 0,
                            servings: "",
                            expertiseRequired: "",
                            caloriesPerServing: "",
                            recipeCategories: "",
                            recipeIngredients: recipe.ingredients,
                            recipeInstructions: recipe.instructions,
                            notes: ""                            
                        )
                    )
                }
            }
        }

        }
    }
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
