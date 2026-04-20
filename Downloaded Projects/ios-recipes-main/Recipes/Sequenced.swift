//
//  Sequenced.swift
//  Recipes
//
//  Created by Stephen Liddle on 11/20/23.
//

import Foundation

protocol Sequenced {
    var sequence: Int { get }
}

func sequenceSort(a: Sequenced, b: Sequenced) -> Bool {
    a.sequence < b.sequence
}
