//
//  Item.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
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
