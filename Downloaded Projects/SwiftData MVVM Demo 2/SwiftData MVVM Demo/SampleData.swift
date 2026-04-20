//
//  SampleData.swift
//  SwiftData MVVM Demo
//
//  Created by Stephen Liddle on 12/6/23.
//

import Foundation

// In this sample data, Item represents a tool, DependentItems are materials
// the tool is made from, and IndependentItems are colors of the tool.

let sampleItems = [
    Recipe(
        title: "Wrench",
        dependentItems: [
            DependentItem(title: "Metal")
        ],
        independentItems: []
    ),
    Recipe(
        title: "Hammer",
        dependentItems: [
            DependentItem(title: "Rubber"),
            DependentItem(title: "Metal")
        ],
        independentItems: []
    ),
    Recipe(
        title: "Needle",
        dependentItems: [
            DependentItem(title: "Metal")
        ],
        independentItems: []
    ),
    Recipe(
        title: "Level",
        dependentItems: [
            DependentItem(title: "Metal"),
            DependentItem(title: "Plastic"),
            DependentItem(title: "Liquid"),
            DependentItem(title: "Paint")
        ],
        independentItems: []
    ),
]

let sampleIndependentItems = [
    Category(title: "Clear"),
    Category(title: "Red"),
    Category(title: "Blue"),
    Category(title: "Black"),
    Category(title: "Yellow"),
    Category(title: "Silver"),
    Category(title: "Brown")
]

// Here are the many-to-many associations we'll add after creating the
// underlying records (Items and IndependentItems).

let sampleAssociations = [
    ("Wrench", "Silver"),
    ("Hammer", "Silver"),
    ("Hammer", "Black"),
    ("Needle", "Silver"),
    ("Level", "Silver"),
    ("Level", "Clear"),
    ("Level", "Red"),
    ("Level", "Yellow")
]
