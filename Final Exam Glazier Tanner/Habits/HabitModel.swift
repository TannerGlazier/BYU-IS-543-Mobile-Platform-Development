//
//  HabitModel.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import Foundation

enum HabitDuration: String, Codable {
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
}

struct Habit: Identifiable, Codable {
    var id: String
    var title: String
    var description: String
    var duration: HabitDuration
    var categoryIds: [String]
    var completeBy: Date

    init(id: String = UUID().uuidString, title: String, description: String, duration: HabitDuration = .daily, categoryIds: [String] = [], completeBy: Date = Date()) {
        self.id = id
        self.title = title
        self.description = description
        self.duration = duration
        self.categoryIds = categoryIds
        self.completeBy = completeBy
    }
    
}
