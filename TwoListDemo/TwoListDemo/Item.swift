//
//  Item.swift
//  TwoListDemo
//
//  Created by Tanner Glazier on 11/30/23.
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

@Model
final class Item2 {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
