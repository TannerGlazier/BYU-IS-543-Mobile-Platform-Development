//
//  RecipeSection+Render.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/20/23.
//

import Foundation

extension RecipeSection {
    var ingredientsMarkdown: String {
        var table = ""

        if !ingredients.isEmpty {
            if hasBakersPercent {
                return breadIngredientsMarkdown
            }

            if hasRatio {
                return ratioIngredientsMarkdown
            }

            if header == nil {
                table = "| **Quantity** | **Ingredient** |\n"
            } else {
                table = "| | |\n"
            }

            table += "| ---: | :--- |\n"

            for ingredient in ingredients.sorted(by: sequenceSort) {
                table += "|\(ingredient.quantityText)|\(ingredient.ingredientText)|\n"
            }
        }

        return table
    }

    // MARK: - Private helpers

    private var breadIngredientsMarkdown: String {
        var table = ""

        if header == nil {
            table = "| **Quantity** | **Ingredient** | **Baker's %** |\n"
        } else {
            table = "| | | |\n"
        }

        table += "| ---: | :--- | ---: |\n"

        for ingredient in ingredients.sorted(by: sequenceSort) {
            table += "|\(ingredient.quantityText)|\(ingredient.ingredientText)|\(ingredient.bakersPercent.formattedString)|\n"
        }

        return table
    }

    private var ratioIngredientsMarkdown: String {
        var table = ""

        if header == nil {
            table = "| **Quantity** | **Ingredient** | **Ratio** |\n"
        } else {
            table = "| | | |\n"
        }

        table += "| ---: | :--- | ---: |\n"

        for ingredient in ingredients.sorted(by: sequenceSort) {
            table += "|\(ingredient.quantityText)|\(ingredient.ingredientText)|\(ingredient.ratio ?? 0)|\n"
        }

        return table
    }

    private var hasBakersPercent: Bool {
        ingredients.filter { $0.bakersPercent != nil }.count > 0
    }

    private var hasRatio: Bool {
        ingredients.filter { $0.ratio != nil }.count > 0
    }
}
