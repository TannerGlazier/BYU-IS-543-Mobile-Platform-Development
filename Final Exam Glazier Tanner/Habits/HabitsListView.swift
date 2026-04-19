//
//  HabitsListView.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import SwiftUI

struct HabitsListView: View {
    @ObservedObject var viewModel: HabitsViewModel
    @State private var showingAddHabit = false

    var body: some View {
        List {
            ForEach(viewModel.habits) { habit in
                NavigationLink(destination: HabitDetailView(habit: habit, categories: categories(for: habit))) {
                    Text(habit.title)
                }
            }
            .onDelete(perform: deleteHabit)
        }
        .navigationBarTitle("Habits")
        .navigationBarItems(trailing: Button("Add Habit") {
            showingAddHabit = true
        })
        .sheet(isPresented: $showingAddHabit) {
            AddHabitView(viewModel: viewModel, isPresented: $showingAddHabit)
        }
    }

    private func deleteHabit(at offsets: IndexSet) {
        viewModel.habits.remove(atOffsets: offsets)
        viewModel.SaveHabits()
    }

    private func categories(for habit: Habit) -> [Category] {
        viewModel.categories.filter { habit.categoryIds.contains($0.id) }
    }
}
