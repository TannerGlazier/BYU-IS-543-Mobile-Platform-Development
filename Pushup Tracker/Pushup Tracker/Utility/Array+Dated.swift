//
//  Array+Dated.swift
//  Pushup Tracker
//
//  Created by Tanner Glazier on 9/19/23.
//

import Foundation

extension Array where Element: Dated {
    func isDateUnique(withRespectTo element: Element) -> Bool {
        var foundDate = false
        
        self.forEach { dated in
            if dated.hasSameDateAs(as: element) {
                foundDate = true
            }
        }
        
        return !foundDate
    }
}
