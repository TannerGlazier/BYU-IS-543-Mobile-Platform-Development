/*
 * This comes from Apple's SwiftDataAnimals project (Preview+ModelContainer.swift).
 * See their original source for comments and explanation.
 * Modified for the Recipes app.
 */

import SwiftData

extension ModelContainer {
    static var sample: () throws -> ModelContainer = {
        let schema = Schema([Recipe.self])
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [configuration])

        Task { @MainActor in
            sampleRecipes.forEach { container.mainContext.insert($0) }
        }

        return container
    }
}
