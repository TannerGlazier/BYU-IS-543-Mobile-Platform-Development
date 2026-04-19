//
//  MediumDateFormatter.swift
//  Pushup Tracker
//
//  Created by Tanner Glazier on 9/25/23.
//

import Foundation

class MediumDateFormatter {
    static let shared = MediumDateFormatter()
    
    let dateFormatter: DateFormatter
    
    private init() {
        dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    
    func string(from date: Date) -> String {
        dateFormatter.string(from: date)
    }
}






private let dateFormatter = {
    let formatter = DateFormatter()
    
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    
    return formatter
}()

func mediumString(from date: Date) -> String {
    dateFormatter.string(from: date)
}
