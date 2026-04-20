//
//  CategoryModel.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/14/23.
//

import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    var categoryName: String
}

class CategoryStorage {
    private var categories: [Category] = []  // Array to store categories
    private let fileURL: URL  // URL for the file to store data

    init() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = documentsDirectory.appendingPathComponent("categories.json")
        loadCategories()
    }

    func loadCategories() {
        do {
            let data = try Data(contentsOf: fileURL)
            categories = try JSONDecoder().decode([Category].self, from: data)
        } catch {
            print("Error loading categories: \(error)")
            categories = []
        }
    }

    func saveCategories(_ categories: [Category]) {
        do {
            let data = try JSONEncoder().encode(categories)
            try data.write(to: fileURL)
        } catch {
            print("Error saving categories: \(error)")
        }
    }

    func getCategories() -> [Category] {
        return categories
    }
}
