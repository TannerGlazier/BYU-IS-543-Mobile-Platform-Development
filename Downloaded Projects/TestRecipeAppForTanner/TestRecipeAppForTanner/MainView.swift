//
//  MainView.swift
//  TestRecipeAppForTanner
//
//  Created by Jackson Schow on 12/14/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = RecipesViewModel()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Show Recipes", destination: RecipesListView(viewModel: viewModel))
                NavigationLink("Manage Categories", destination: CategoriesView(viewModel: viewModel))
            }
            .navigationBarTitle("Recipes App")
        }
    }
}
