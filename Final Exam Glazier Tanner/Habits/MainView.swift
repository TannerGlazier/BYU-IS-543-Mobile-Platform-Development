//
//  MainView.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = HabitsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Show Habits", destination: HabitsListView(viewModel: viewModel))
                NavigationLink("Manage Categories", destination: CategoriesView(viewModel: viewModel))
            }
            .navigationBarTitle("Habits App")
        }
    }
}
