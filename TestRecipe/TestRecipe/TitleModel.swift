//
//  TitleModel.swift
//  TestRecipe
//
//  Created by Tanner Glazier on 12/13/23.
import Foundation
import SwiftData

struct TitleModel {
    // Key for storing the title in UserDefaults
    private let titleKey = "titleKey"

    // Save title to UserDefaults
    func saveTitle(_ title: String) {
        UserDefaults.standard.set(title, forKey: titleKey)
    }

    // Retrieve title from UserDefaults
    func getTitle() -> String {
        UserDefaults.standard.string(forKey: titleKey) ?? ""
    }
}
