//
//  RecipeCatalogView.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/16/23.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct RecipeCatalogView: View {

    // MARK: - Properties

    @Environment(RecipeViewModel.self) var viewModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    @State private var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    @State private var deviceContext = DeviceContext.other
    @State private var isEditing = false
    @State private var searchText = ""

    // MARK: - Main body

    var body: some View {
        GeometryReader { geometry in
            NavigationSplitView(columnVisibility: $columnVisibility) {
                categoriesList
                    .navigationTitle(Constants.recipes)
            } content: {
                primaryNavigationView
                    .navigationTitle(Constants.recipes)
            } detail: {
                // NEEDSWORK: when the selected recipe has been deleted, we should
                // reset to this view
                Text("Select a recipe")
            }
            .searchable(text: $searchText)
            .onChange(of: geometry.size.width) {
                // When the user rotates, we need to recompute the context
                deviceContext = DeviceContext.context(for: geometry.size, horizontalSizeClass, verticalSizeClass)
            }
            .sheet(isPresented: $isEditing) {
                RecipeEditor(recipe: nil)
            }
            .task {
                // Compute the context on initial launch as well
                deviceContext = DeviceContext.context(for: geometry.size, horizontalSizeClass, verticalSizeClass)

                if viewModel.recipes.isEmpty {
                    initializeRecipes()
                }
            }
        }
    }

    // MARK: - View hierarchy

    private var categoriesList: some View {
        List {
            favoritesSection
            categoriesSection
        }
    }

    @ViewBuilder
    private var categoriesSection: some View {
        targetList(
            list: viewModel.courses,
            field: { $0.course },
            title: Constants.courses
        )
        targetList(
            list: viewModel.cuisines,
            field: { $0.cuisine },
            title: Constants.cuisines
        )
        targetList(
            list: viewModel.authors,
            field: { $0.author },
            title: Constants.authors
        )
        targetList(
            list: viewModel.difficultyLevels,
            field: { $0.difficultyLevel },
            title: Constants.difficultyLevel
        )
    }

    private var favoritesSection: some View {
        Section {
            NavigationLink {
                primaryNavigationView
                    .navigationTitle(Constants.recipes)
            } label: {
                Text(Constants.browseAllRecipes)
            }

            NavigationLink {
                RecipeListView(
                    viewModel.favorites,
                    description: Constants.favorites,
                    willAppear: "New favorites you mark",
                    searchText: searchText,
                    deviceContext: deviceContext,
                    columnVisibility: $columnVisibility
                )
                .navigationTitle(Constants.favorites)
                .toolbar {
                    mainToolbar
                }
            } label: {
                Text(Constants.favorites)
            }
        }
    }

    @ToolbarContentBuilder
    private var mainToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            EditButton()
        }
        ToolbarItem {
            Button(action: addRecipe) {
                Label("Add Recipe", systemImage: "plus")
            }
        }
    }

    private var primaryNavigationView: some View {
        RecipeListView(
            viewModel.recipes,
            searchText: searchText,
            deviceContext: deviceContext,
            columnVisibility: $columnVisibility
        )
        .toolbar {
            mainToolbar
        }
    }

    @ViewBuilder
    private func targetList(
        list: [String],
        field: @escaping (Recipe) -> String,
        title: String
    ) -> some View {
        if !list.isEmpty {
            Section(title) {
                ForEach(list, id: \.self) { item in
                    let lowercasedFilter = item.lowercased()

                    NavigationLink {
                        RecipeListView(
                            viewModel.recipes.filter { field($0).lowercased().contains(lowercasedFilter) },
                            searchText: searchText,
                            deviceContext: deviceContext,
                            columnVisibility: $columnVisibility
                        )
                        .navigationTitle(item)
                        .toolbar {
                            mainToolbar
                        }
                    } label: {
                        Text(item)
                    }
                }
            }
        }
    }

    // MARK: - Private helpers

    private func addRecipe() {
        isEditing = true
    }

    private func initializeRecipes() {
        withAnimation {
            viewModel.replaceAllRecipes(sampleRecipes)
        }
    }

    // MARK: - Constants

    private struct Constants {
        static let authors = "Authors"
        static let browseAllRecipes = "Browse all"
        static let courses = "Courses"
        static let cuisines = "Cuisines"
        static let difficultyLevel = "Difficulty"
        static let favorites = "Favorites"
        static let recipes = "Steve's Recipes"
        static let scrollTargetId = 1
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        RecipeCatalogView()
    }
}
