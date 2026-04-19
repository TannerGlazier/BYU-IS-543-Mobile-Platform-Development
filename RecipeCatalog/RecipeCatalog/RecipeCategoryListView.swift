//
//  RecipeCategoryListView.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import SwiftUI
import SwiftData

struct RecipeCategoryListView: View{
    @Environment(NavigationContext.self) private var navigationContext
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \RecipeCategory.name) private var recipeCategories: [RecipeCategory]
    @State private var isReloadPresented = false
    
    var body: some View {
        @Bindable var navigationContext = navigationContext
        List(selection:$navigationContext.selectedRecipeCategoryName){
            ListCategories(recipeCategories: recipeCategories)
        }
        .alert("Reload Sample Data?", isPresented: $isReloadPresented){
            Button("Yes, reload sample data", role: .destructive) {
                reloadSampleData()
            }
        } message: {
            Text("Reloading the sample data deletes all changes to the current data.")
        }
        .toolbar {
            Button {
                isReloadPresented = true
            } label: {
                Label("", systemImage: "arrow.clockwise")
                    .help("Reload sample data")
            }
        }
        .task {
            if recipeCategories.isEmpty {
                RecipeCategory.insertSampleData(modelContext: modelContext)
            }
        }
    }
    
    @MainActor
    private func reloadSampleData(){
        navigationContext.selectedRecipe = nil
        navigationContext.selectedRecipeCategoryName = nil
        RecipeCategory.reloadSampleData(modelContext: modelContext)
    }
}

private struct ListCategories: View{
    var recipeCategories: [RecipeCategory]
    
    var body: some View {
        ForEach(recipeCategories) {recipeCategory in
            NavigationLink(recipeCategory.name, value: recipeCategory.name)
        }
    }
}

#Preview("RecipeCategoryListView"){
    ModelContainerPreview(ModelContainer.sample){
        NavigationStack{
            RecipeCategoryListView()
        }
        .environment(NavigationContext())
    }
}

#Preview("ListCategories"){
    ModelContainerPreview(ModelContainer.sample){
        NavigationStack{
            List{
                ListCategories(recipeCategories: [.dinner, .dessert])
            }
        }
        .environment(NavigationContext())
    }
}
