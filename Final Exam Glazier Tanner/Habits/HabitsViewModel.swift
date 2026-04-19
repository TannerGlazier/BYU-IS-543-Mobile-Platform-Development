//
//  HabitViewModel.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import Foundation

class HabitsViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    @Published var categories: [Category] = []
    
    init() {
        loadHabits()
        loadCategories()
        
        if categories.isEmpty {
            addDefaultCategories()
        }
    }
    
    func SaveHabits() {
        do {
            let filePath = documentDirectory().appendingPathComponent("habits.json")
            let data = try JSONEncoder().encode(habits)
            try data.write(to: filePath)
        } catch {
            print("Error saving habits: \(error)")
        }
    }
    
    private func loadHabits() {
        let filePath = documentDirectory().appendingPathComponent("habits.json")
        do {
            let data = try Data(contentsOf: filePath)
            habits = try JSONDecoder().decode([Habit].self, from: data)
        } catch {
            print("Error loading habits: \(error)")
        }
    }
    
    func saveCategories() {
        do {
            let filePath = documentDirectory().appendingPathComponent("categories.json")
            let data = try JSONEncoder().encode(categories)
            try data.write(to: filePath)
        } catch {
            print("Error saving categories: \(error)")
        }
    }
    
    private func loadCategories() {
        let filePath = documentDirectory().appendingPathComponent("categories.json")
        do {
            let data = try Data(contentsOf: filePath)
            categories = try JSONDecoder().decode([Category].self, from: data)
        } catch {
            print("Error loading categories: \(error)")
        }
    }
    
    private func documentDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func addHabit(title: String, description: String, duration: HabitDuration, categoryIds: [String], completeBy: Date) {
        let newHabit = Habit(title: title, description: description, duration: duration,  categoryIds: categoryIds, completeBy: completeBy)
        habits.append(newHabit)
        SaveHabits()
    }
    
    func addCategory(name: String) {
        let newCategory = Category(name: name)
        categories.append(newCategory)
        saveCategories()
    }
    
    func editHabit(habit: Habit, title: String, description: String, duration: HabitDuration, categoryIds: [String], completeBy: Date) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].title = title
            habits[index].description = description
            habits[index].duration = duration
            habits[index].categoryIds = categoryIds
            habits[index].completeBy = completeBy
            SaveHabits()
        }
    }
    private func addDefaultCategories() {
        let defaultCategories = [
            Category(name: "Health"),
            Category(name: "Fitness"),
            Category(name: "Productivity"),
            Category(name: "Education")
        ]

        categories.append(contentsOf: defaultCategories)
        saveCategories()
    }
}
