//
//  TestRecipeAppForTannerApp.swift
//  TestRecipeAppForTanner
//
//  Created by Jackson Schow on 12/14/23.
//

import SwiftUI

@main
struct RecipesApp: App {
    var viewModel = RecipesViewModel()

    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(viewModel)
        }
    }
}
