//
//  Item.swift
//  RecipeCatalog
//
//  Created by Tanner Glazier on 12/5/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
