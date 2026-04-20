//
//  RecipeDetailView.swift
//  TestRecipeAppForTanner
//
//  Created by Jackson Schow on 12/14/23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    var categories: [Category]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(recipe.title)
                .font(.title)
                .fontWeight(.bold)

            Text("Categories:")
                .font(.headline)

            ForEach(categories, id: \.id) { category in
                Text(category.name)
                    .padding(.leading, 8)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Recipe Details", displayMode: .inline)
    }
}
