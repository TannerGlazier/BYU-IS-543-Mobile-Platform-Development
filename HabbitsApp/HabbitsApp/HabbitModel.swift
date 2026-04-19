//
//  HabbitModel.swift
//  HabbitsApp
//
//  Created by Tanner Glazier on 12/21/23.
//

import Foundation

struct Habbit: Identifiable, Codable {
    var id: String
    var title: String
    var categoryIds: [String]

    init(id: String = UUID().uuidString, title: String, categoryIds: [String] = []) {
        self.id = id
        self.title = title
        self.categoryIds = categoryIds
    }
    
}
