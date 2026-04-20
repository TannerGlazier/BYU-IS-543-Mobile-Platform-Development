//
//  Recipe.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/16/23.
//

import Foundation
import SwiftData

// The main idea of this data model is to have a sequence of flexible
// RecipeSections that can each have lists of ingredients, a header,
// and some text below.  This lets us have very flexible recipes of
// different organization styles.

@Model
final class Recipe {
    var title: String
    var subtitle: String
    var summary: String
    var course: String
    var cuisine: String
    var difficultyLevel: String
    var author: String
    var duration: String
    var servings: String
    var calories: String
    @Relationship(deleteRule: .cascade)
    var sections: [RecipeSection]
    var notes: String
    var isFavorite: Bool

    init(title: String, subtitle: String, summary: String, course: String, cuisine: String, difficultyLevel: String, author: String, duration: String, servings: String, calories: String, sections: [RecipeSection], notes: String, isFavorite: Bool = false) {
        self.title = title
        self.subtitle = subtitle
        self.summary = summary
        self.course = course
        self.cuisine = cuisine
        self.difficultyLevel = difficultyLevel
        self.author = author
        self.duration = duration
        self.servings = servings
        self.calories = calories
        self.sections = sections
        self.notes = notes
        self.isFavorite = isFavorite
    }
}

extension Recipe {
    // These are the fields we'll search when the user types in the .searchable
    // text field (to filter the list according to the user's search terms).
    var asSearchString: String {
        var result = "\(title) \(subtitle) \(summary) \(course) \(cuisine) \(difficultyLevel) \(author) \(duration) \(servings) \(calories) \(notes) "

        sections.forEach {
            result += $0.asSearchString
        }

        return result.lowercased()
    }
}
