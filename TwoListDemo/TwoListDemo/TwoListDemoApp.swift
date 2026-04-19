//
//  TwoListDemoApp.swift
//  TwoListDemo
//
//  Created by Tanner Glazier on 11/30/23.
//

import SwiftUI
import SwiftData

@main
struct TwoListDemoApp: App {
        var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(item.self, item2.self)
    }
}
