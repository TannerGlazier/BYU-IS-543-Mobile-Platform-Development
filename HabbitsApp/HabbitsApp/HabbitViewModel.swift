//
//  HabbitViewModel.swift
//  HabbitsApp
//
//  Created by Tanner Glazier on 12/21/23.
//

import Foundation

class HabbitViewModel: ObservableObject {
    @Published var habbits: [Habbit] = []
    @Published var categories: [Category] = []
    
    init() {
        loadHabbits()
        loadCategories()
    }
    
    func SaveHabbits() {
        do {
            let filePath = documentDirectory().appendingPathComponent("habbits.json")
            let data = try JSONEncoder().encode(habbits)
            try data.write(to: filePath)
        } catch {
            print("Error saving habbits: \(error)")
        }
    }
}
