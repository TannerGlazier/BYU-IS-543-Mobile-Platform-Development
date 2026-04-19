//
//  WorkoutReport+DateString.swift
//  Pushup Tracker
//
//  Created by Tanner Glazier on 9/26/23.
//

import Foundation

extension PushupModel.WorkoutReport {
    var dateString: String {
        MediumDateFormatter.shared.string(from: date)
    }
}
