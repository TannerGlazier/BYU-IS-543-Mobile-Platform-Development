//
//  CategoryModel.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import Foundation

struct Category: Identifiable, Codable {
    var id: String
    var name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}
