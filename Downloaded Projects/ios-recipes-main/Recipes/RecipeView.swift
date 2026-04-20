//
//  RecipeView.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/18/23.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct RecipeView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    @State private var isEditing = false

    let recipe: Recipe
    let size: CGSize

    var body: some View {
        mainView
        .sheet(isPresented: $isEditing) {
            RecipeEditor(recipe: recipe)
        }
    }

    // MARK: - View hierarchy

    @ViewBuilder
    private func labeledMarkdownField(for field: String, label: String) -> some View {
        if !field.isEmpty {
            Markdown {
                "**\(label):** \(field)"
            }
            .padding(.bottom, Constants.infoFieldPadding)
        }
    }

    var mainView: some View {
        var horizontalPadding = Double.zero

        if let horizontalSizeClass, horizontalSizeClass == .compact {
            // Use the default of 0
        } else {
            horizontalPadding = (size.width - Constants.maxLineWidth) / 2
        }

        return VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                Rectangle().fill(Color("RecipeHeader"))
                Rectangle().stroke().foregroundStyle(Color("RecipeHeaderBorder"))
                VStack(alignment: .leading, spacing: 0) {
                    Text(recipe.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.bottom, Constants.infoFieldPadding)

                    if !recipe.subtitle.isEmpty {
                        Text(recipe.subtitle)
                            .font(.title2)
                            .padding(.bottom, Constants.infoFieldPadding)
                    }

                    if !recipe.author.isEmpty {
                        Text("By \(recipe.author)")
                            .font(.callout)
                            .padding(.bottom, Constants.infoFieldPadding)
                    }

                    if !recipe.summary.isEmpty {
                        Markdown {
                            recipe.summary
                        }
                        .padding(.vertical, Constants.summaryPadding)
                    }

                    labeledMarkdownField(for: recipe.course, label: "Course")
                    labeledMarkdownField(for: recipe.cuisine, label: "Cuisine")
                    labeledMarkdownField(for: recipe.difficultyLevel, label: "Difficulty Level")
                    labeledMarkdownField(for: recipe.duration, label: "Time")
                    labeledMarkdownField(for: recipe.servings, label: "Servings")
                    labeledMarkdownField(for: recipe.calories, label: "Calories")
                }
                .padding(Constants.headerBlockPadding)
            }

            ForEach(recipe.sections.sorted(by: sequenceSort), id: \.sequence) { section in
                RecipeSectionView(section: section)
            }

            if !recipe.notes.isEmpty {
                HeadlineText("Notes")
                Markdown {
                    recipe.notes
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.bottom, Constants.bottomPadding)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(recipe.title)
            }

            ToolbarItem {
                Button(action: {
                    withAnimation {
                        recipe.isFavorite.toggle()
                    }
                }, label: {
                    Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .help("Toggle recipe favorite status")
                })
            }

            ToolbarItem {
                Button {
                    isEditing = true
                } label: {
                    Label("Edit \(recipe.title)", systemImage: "pencil")
                        .help("Edit the recipe")
                }
            }
        }
    }

    // MARK: - Drawing constants

    private struct Constants {
        static let bottomPadding = 70.0
        static let floatButtonPadding = 10.0
        static let floatPadding = 20.0
        static let headerBlockPadding = 8.0
        static let infoFieldPadding = 4.0
        static let maxLineWidth = 550.0
        static let summaryPadding = 8.0
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    RecipeView(recipe: sampleRecipes[0], size: geometry.size)
                        .padding()
                }
            }
        }
    }
}
