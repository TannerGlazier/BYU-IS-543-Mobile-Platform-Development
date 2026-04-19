//
//  CategoriesView.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var viewModel: HabitsViewModel
    @State private var newCategoryName = ""

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.categories) { category in
                    Text(category.name)
                }
                .onDelete(perform: deleteCategory)
            }
            
            HStack {
                TextField("New Category", text: $newCategoryName)
                Button("Add") {
                    addNewCategory()
                }
            }
            .padding()
        }
        .navigationBarTitle("Categories")
    }

    private func addNewCategory() {
        viewModel.addCategory(name: newCategoryName)
        newCategoryName = ""
    }

    private func deleteCategory(at offsets: IndexSet) {
        viewModel.categories.remove(atOffsets: offsets)
        viewModel.saveCategories()
    }
}
