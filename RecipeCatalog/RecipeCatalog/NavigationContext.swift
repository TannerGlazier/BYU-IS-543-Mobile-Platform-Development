//
//  NavigationContext.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import SwiftUI

@Observable
class NavigationContext {
    var selectedRecipeCategoryName: String?
    var selectedRecipe: Recipe?
    var columnVisibility: NavigationSplitViewVisibility
    
    var sidebarTitle = "Categories"
    
    var contentListTitle: String {
        if let selectedRecipeCategoryName {
            selectedRecipeCategoryName
        } else {
            ""
        }
    }
    
    init(selectedRecipeCategoryName: String? = nil,
         selectedRecipe: Recipe? = nil,
         columnVisibility: NavigationSplitViewVisibility = .automatic){
        self.selectedRecipeCategoryName = selectedRecipeCategoryName
        self.selectedRecipe = selectedRecipe
        self.columnVisibility = columnVisibility
    }
}
