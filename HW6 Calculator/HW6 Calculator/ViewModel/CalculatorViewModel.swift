//
//  CalculatorViewModel.swift
//  HW6 Calculator
//
//  Created by Tanner Glazier on 9/28/23.
//

import Foundation


@Observable class CalculatorViewModel {
    // MARK: - Properties
    
    var playsound = true {
        didset{
            print("Play sound \()")
        }
    }
    
    var soundPlayer = SoundPlayer()
    // MARK: - Model access
    
    // MARK - User intents
    
    func handleButtonTap(){
        Task{
            await soundPlayer.PlaySound(named: "click.m4a")
        }
        
    }
    
    func addNumber(){
        
    }
    
    func subtractNumber(){
        
    }
    
    func multiplyNumber(){
        
    }
    
    func divideNumber(){
        
    }
    
    func clearNumber(){
        
    }
}
