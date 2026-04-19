//
//  HabitsApp.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import SwiftUI
import SwiftData

@main
struct HabitsApp: App {
    var viewModel = HabitsViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(viewModel)
        }
    }
}
