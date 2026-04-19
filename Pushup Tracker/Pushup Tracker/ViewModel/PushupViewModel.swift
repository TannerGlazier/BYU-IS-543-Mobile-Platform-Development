//
//  PushupViewModel.swift
//  Pushup Tracker
//
//  Created by Tanner Glazier on 9/18/23.
//

import Foundation

@Observable class PushupViewModel{
    
    // MARK: - Constants
    
    private struct Constants{
        static let maxDaysPerMonth = 31
        
        static let maxDailyPushupsForKyle = 50
        static let maxDateValueForKyle = 11 * maxDaysPerMonth + 10
        static let minDateValueForKyle = 8 * maxDaysPerMonth + 3
    }
  
    // MARK: - Properties
    
    private var pushupData = PushupModel()
    
    //MARK: - Model access
    
    var pushupsThatCount: Int {
        pushupData.workouts
            .filter { dateCountsForKyle($0.date)}
            .reduce(0) {$0 + min($1.count, Constants.maxDailyPushupsForKyle)}
    }
    
    var totalCount: Int {
        pushupData.workouts.reduce(0) { $0 + $1.count }
    }
    
    var workouts: [PushupModel.WorkoutReport] {
        pushupData.workouts
            .sorted{ $0.date > $1.date}
    }
    
    //MARK: - User intents
    
    func addWorkout(date: Date, cout: Int){
        //NEEDSWORK
    }
    
    func deleteWorkout(id:UUID){
        //NEEDSWORK
    }
    
    func updateWorkout(id: UUID, date: Date, count: Int){
        //NEEDSWORK
    }
    
    // MARK: - Helpers
    
    func dateCountsForKyle(_ date: Date) -> Bool {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let currentYearComponents = Calendar.current.dateComponents([.year], from: Date())
        
        guard let year = components.year, let month = components.month, let day = components.day, let currentYear =
                currentYearComponents.year else {
            return false
        }
        
        let dateValue = month * Constants.maxDaysPerMonth + day
        
        return dateValue >= Constants.minDateValueForKyle
        && dateValue <= Constants.maxDateValueForKyle
        && year == currentYear
    }
}
