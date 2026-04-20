//
//  RecipeModel.swift
//  TestRecipeAppForTanner
//
//  Created by Jackson Schow on 12/14/23.
//

import Foundation

struct Recipe: Identifiable, Codable {
    var id: String
    var title: String
    var categoryIds: [String]

    init(id: String = UUID().uuidString, title: String, categoryIds: [String] = []) {
        self.id = id
        self.title = title
        self.categoryIds = categoryIds
    }
}
