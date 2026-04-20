//
//  AddCategoryView.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/14/23.
//

import SwiftUI

struct AddCategoryView: View {
    @ObservedObject var viewModel: RecipeViewModel
    @State private var categoryName = ""

    var body: some View {
        Form {
            Section(header: Text("New Category")) {
                TextField("Enter category name", text: $categoryName)
            }
            Section {
                Button("Add Category") {
                    if !categoryName.isEmpty {
                        let newCategory = Category(categoryName: categoryName)
                        viewModel.categories.append(newCategory)
                        viewModel.saveCategories(viewModel.categories)
                        categoryName = ""
                    }
                }
            }
        }
        .navigationTitle("Add Category")
    }
}
