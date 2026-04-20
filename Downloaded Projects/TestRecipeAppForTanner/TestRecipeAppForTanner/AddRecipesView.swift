//
//  AddRecipesView.swift
//  TestRecipeAppForTanner
//
//  Created by Jackson Schow on 12/14/23.
//

import SwiftUI

struct AddRecipeView: View {
    @ObservedObject var viewModel: RecipesViewModel
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var selectedCategoryIds: [String] = []

    var body: some View {
        NavigationView {
            Form {
                TextField("Recipe Title", text: $title)
                
                Section(header: Text("Categories")) {
                    ForEach(viewModel.categories) { category in
                        MultipleSelectionRow(title: category.name, isSelected: selectedCategoryIds.contains(category.id)) {
                            if selectedCategoryIds.contains(category.id) {
                                selectedCategoryIds.removeAll { $0 == category.id }
                            } else {
                                selectedCategoryIds.append(category.id)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Add Recipe", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            }, trailing: Button("Save") {
                viewModel.addRecipe(title: title, categoryIds: selectedCategoryIds)
                isPresented = false
            }.disabled(title.isEmpty))
        }
    }
}

// Helper View for multiple selection
struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
