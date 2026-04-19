//
//  ThreeColumnContentView.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import SwiftUI
import SwiftData

struct ThreeColumnContentView: View{
    @Environment(NavigationContext.self) private var navigationContext
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        @Bindable var navigationContext = navigationContext
        NavigationSplitView(columnVisibility: $navigationContext.columnVisibility) {
            RecipeCategoryListView()
                .navigationTitle(navigationContext.sidebarTitle)
        } content: {
            RecipeListView(recipeCategoryName: navigationContext.selectedRecipeCategoryName)
                .navigationTitle(navigationContext.contentListTitle)
        }detail: {
            NavigationStack {
                RecipeDetailView(recipe: navigationContext.selectedRecipe)
            }
        }
    }
}

#Preview{
    ModelContainerPreview(ModelContainer.sample){
        ThreeColumnContentView()
            .environment(NavigationContext())
    }
}
