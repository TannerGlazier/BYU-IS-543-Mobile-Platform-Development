//
//  TwoListDemoApp.swift
//  TwoListDemo
//
//  Created by Stephen Liddle on 11/30/23.
//

import SwiftUI
import SwiftData

@main
struct TwoListDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Item.self, Item2.self])
    }
}
