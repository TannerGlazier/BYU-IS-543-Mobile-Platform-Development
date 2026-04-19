//
//  TitleViewModel.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
//

import Foundation

class TitleViewModel: ObservableObject {
    @Published var title: String = ""
    private var titleModel = TitleModel()

    init() {
        // Load the initial title from UserDefaults
        title = titleModel.getTitle()
    }

    func saveTitle() {
        titleModel.saveTitle(title)
    }
}
