//
//  EditHabitView.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

// https://chat.openai.com/share/7812ee2f-4b88-4dae-aac3-b44dd28b43c2

import SwiftUI
struct EditHabitView: View {
    @ObservedObject var viewModel: HabitsViewModel
    var habit: Habit
    @Binding var isPresented: Bool
    @State private var title: String
    @State private var description: String
    @State private var selectedCategoryIds: [String]
    @State private var selectedDuration: HabitDuration
    @State private var completeBy: Date

    init(viewModel: HabitsViewModel, habit: Habit, isPresented: Binding<Bool>) {
        self.viewModel = viewModel
        self.habit = habit
        self._isPresented = isPresented
        self._title = State(initialValue: habit.title)
        self._description = State(initialValue: habit.description)
        self._selectedDuration = State(initialValue: habit.duration)
        self._selectedCategoryIds = State(initialValue: habit.categoryIds)
        self._completeBy = State(initialValue: habit.completeBy)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Habit Title", text: $title)
                TextField("Habit Description", text: $description)
                
                Section(header: Text("Categories")) {
                    ForEach(viewModel.categories) { category in
                        MultipleSelectionRow(title: category.name, isSelected: selectedCategoryIds.contains(category.id)) {
                            if selectedCategoryIds.contains(category.id) {
                                selectedCategoryIds.removeAll { $0 == category.id }
                            } else {
                                selectedCategoryIds.append(category.id)
                            }
                        }
                    }
                }
                Section(header: Text("Duration")) {
                    Picker("Select Duration", selection: $selectedDuration) {
                        Text("Daily").tag(HabitDuration.daily)
                        Text("Weekly").tag(HabitDuration.weekly)
                        Text("Monthly").tag(HabitDuration.monthly)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("Edit Habit", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            }, trailing: Button("Save") {
                viewModel.editHabit(habit: habit, title: title, description: description, duration: selectedDuration, categoryIds: selectedCategoryIds, completeBy: completeBy)
                isPresented = false
            }.disabled(title.isEmpty))
        }
    }
}

