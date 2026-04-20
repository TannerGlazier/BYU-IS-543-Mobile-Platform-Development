//
//  RecipesApp.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/16/23.
//

import SwiftUI
import SwiftData

@main
struct RecipesApp: App {
    let container: ModelContainer
    let viewModel: RecipeViewModel

    var body: some Scene {
        WindowGroup {
            RecipeCatalogView()
                .environment(viewModel)
        }
        .modelContainer(container)
    }

    init() {
        do {
            container = try ModelContainer(for: Recipe.self)
        } catch {
            fatalError("""
                Failed to create ModelContainer for Recipe.  If you made a
                change to the Model, then uninstall the app and restart it
                from Xcode.
                """)
        }

        viewModel = RecipeViewModel(container.mainContext)
    }
}
