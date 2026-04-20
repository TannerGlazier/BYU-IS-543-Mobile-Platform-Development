//
//  Preferences.swift
//  Day8 Calculator
//
//  Created by Tanner Glazier on 10/5/23.
//

import Foundation

struct Preferences{
    private var soundIsEnabled = UserDefaults.standard.bool(forKey: Key.enableSound) {
        didSet {
            UserDefaults.standard.set(soundIsEnabled, forKey: Key.enableSound)
        }
    }
    
    //private var _enableSound = UserDefaults.standard.Bool(forKey: Key.enableSound)
    
    //var enableSound: Bool {
        //get {
            //_enableSound
        //}
        //set {
            //_enableSound = newValue
            //UserDefaults.standard.set(newValue, forKey: Key.enableSound)
        //}
    //}
    
    private struct Key {
        static let enableSound = "EnableSound"
    }
}
