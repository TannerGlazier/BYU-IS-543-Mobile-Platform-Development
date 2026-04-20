//
//  Item.swift
//  TwoListDemo
//
//  Created by Stephen Liddle on 11/30/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var title: String

    init(timestamp: Date, title: String) {
        self.timestamp = timestamp
        self.title = title
    }
}

@Model
final class Item2 {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

