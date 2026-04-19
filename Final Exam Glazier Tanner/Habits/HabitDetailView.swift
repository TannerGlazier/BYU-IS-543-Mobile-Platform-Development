//
//  HabitDetailView.swift
//  Habits
//
//  Created by Tanner Glazier on 12/21/23.
//

import SwiftUI

struct HabitDetailView: View {
    var habit: Habit
    var categories: [Category]
    @State private var isEditing = false
    
    var body: some View {
        VStack/*(alignment: .leading, spacing: 10) */{
            Text(habit.title)
                .font(.title)
                .fontWeight(.bold)
            
            Text("Categories:")
                .font(.headline)
            
            ForEach(categories, id: \.id) { category in
                Text(category.name)
                    .padding(.leading, 8)
            }
            
            Text("Description")
                .font(.headline)
            Text(habit.description)
            
            Text("Duration:")
                .font(.headline)
            Text(habit.duration.rawValue)
            
            Button("Edit") {
                isEditing = true
            }
            .sheet(isPresented: $isEditing){
                EditHabitView(viewModel: HabitsViewModel(), habit: habit, isPresented: $isEditing)
            }
        }
        .padding()
        .navigationBarTitle("Habit Details", displayMode: .inline)
    }
}
