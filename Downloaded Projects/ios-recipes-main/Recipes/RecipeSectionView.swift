//
//  RecipeSectionView.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/18/23.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct RecipeSectionView: View {
    let section: RecipeSection

    var body: some View {
        if let header = section.header {
            HeadlineText(header)
        }

        if section.ingredients.count > 0 {
            Markdown {
                section.ingredientsMarkdown
            }
            .tableColumnHeaders(.hidden)
            .markdownBlockStyle(\.table) { configuration in
                configuration.label
                    .markdownTableBorderStyle(
                        TableBorderStyle(
                            .allBorders,
                            color: .clear,
                            strokeStyle: .init(lineWidth: 0)
                        )
                    )
            }
            .markdownBlockStyle(\.tableCell) { configuration in
                configuration.label
                    .padding(.vertical, Constants.markdownVerticalPadding)
                    .padding(.horizontal, Constants.markdownHorizontalPadding)
                    .markdownMargin(
                        top: Constants.markdownMargin,
                        bottom: Constants.markdownMargin
                    )
            }
        }

        if let text = section.text {
            Markdown {
                text
            }
            .padding(.top, Constants.directionsTopPadding)
        }
    }

    private struct Constants {
        static let directionsTopPadding = 4.0
        static let markdownHorizontalPadding = 6.0
        static let markdownMargin = RelativeSize.em(0.25)
        static let markdownVerticalPadding = 2.0
    }
}

#Preview {
    ModelContainerPreview(ModelContainer.sample) {
        VStack {
            RecipeSectionView(section: sampleRecipes[0].sections[0])
            RecipeSectionView(section: sampleRecipes[0].sections[1])
        }
    }
}
