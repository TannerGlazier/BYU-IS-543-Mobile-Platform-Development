/*
 * This comes from Apple's SwiftDataAnimals project.
 * See their original source for comments and explanation.
 * Modified for the Recipes app.
 */

import SwiftUI
import SwiftData

struct ModelContainerPreview<Content: View>: View {
    var content: () -> Content
    let container: ModelContainer

    init(@ViewBuilder content: @escaping () -> Content, modelContainer: @escaping () throws -> ModelContainer) {
        self.content = content

        do {
            self.container = try MainActor.assumeIsolated(modelContainer)
        } catch {
            fatalError("Failed to create the model container: \(error.localizedDescription)")
        }
    }

    init(_ modelContainer: @escaping () throws -> ModelContainer, @ViewBuilder content: @escaping () -> Content) {
        self.init(content: content, modelContainer: modelContainer)
    }

    var body: some View {
        // Our app requires a RecipeViewModel in the environment.
        let viewModel = RecipeViewModel(container.mainContext)

        return content()
            .modelContainer(container)
            .environment(viewModel)
    }
}
