//
//  AddHabitsView.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var viewModel: HabitsViewModel
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedCategoryIds: [String] = []
    @State private var selectedDuration:HabitDuration = .daily
    @State private var completeBy = Date()

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
                
                Section(header: Text("Complete By")) {
                    DatePicker("Select Date", selection: $completeBy, displayedComponents: .date)
                }
            }
            .navigationBarTitle("Add Habit", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                isPresented = false
            }, trailing: Button("Save") {
                viewModel.addHabit(title: title, description: description, duration: selectedDuration, categoryIds: selectedCategoryIds, completeBy: completeBy)
                isPresented = false
            }.disabled(title.isEmpty))
        }
    }
}

// Helper View for multiple selection
struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
